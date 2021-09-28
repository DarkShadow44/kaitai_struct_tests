package io.kaitai.struct.testtranslator.specgenerators

import io.kaitai.struct.datatype.{DataType, KSError}
import io.kaitai.struct.exprlang.Ast
import io.kaitai.struct.languages.CCompiler
import io.kaitai.struct.testtranslator.{Main, TestAssert, TestSpec}
import io.kaitai.struct.translators.CTranslator
import io.kaitai.struct.{ClassTypeProvider, RuntimeConfig}
import io.kaitai.struct.languages.components.CppImportList

class CSG(spec: TestSpec, provider: ClassTypeProvider) extends BaseGenerator(spec) {
  val compiler = new CCompiler(provider, RuntimeConfig())
  val className = spec.id.toLowerCase()
  val cppImportList = new CppImportList
  val translator = new CTranslator(provider, cppImportList)

  override def fileName(name: String): String = s"test_$name.cpp"

  cppImportList.addLocal("operators.h")
  cppImportList.addSystem("boost/test/unit_test.hpp")
  spec.extraImports.foreach(entry => cppImportList.addLocal(s"$entry.h"))
  cppImportList.addSystem("stdio.h")

  override def header() = {
    out.puts(s"BOOST_AUTO_TEST_CASE(test_${spec.id}) {")
    out.inc
  }

  override def runParse(): Unit = {
    runParseCommon1()
    out.puts(s"BOOST_CHECK_EQUAL(error, 0);")
  }

  override def runParseExpectError(exception: KSError): Unit = {
    runParseCommon1()
    out.puts(s"BOOST_CHECK_EQUAL(error == 0, 0);")
  }

  def runParseCommon1(): Unit = {
    out.puts(s"ksx_$className data;")
    out.puts("ks_stream stream;")
    out.puts("ks_config config;")
    out.puts("int error;")
    out.puts("ks_config_init(&config);")
    out.puts("FILE* file = fopen(\"src/" + spec.data + "\", \"r\");")
    out.puts("ks_stream_init_from_file(&stream, file, &config);")
    out.puts(s"error = ksx_read_${className}_from_stream(&stream, &data);")
  }

  override def footer() = {
    out.puts
    out.dec
    out.puts("}")
  }

  def simpleAssert(check: TestAssert): Unit = {
    val actStr = translateAct(check.actual)
    val expStr = translator.translate(check.expected)
    out.puts(s"BOOST_CHECK_EQUAL($actStr, $expStr);")
  }

  override def floatAssert(check: TestAssert): Unit = {
    val actStr = translateAct(check.actual)
    val expStr = translator.translate(check.expected)
    out.puts(s"BOOST_CHECK_CLOSE($actStr, $expStr, 1e-4);")
  }

  def nullAssert(actual: Ast.expr): Unit = {
    val nullCheckStr = actual match {
      case Ast.expr.Attribute(x, Ast.identifier(attrName)) =>
       fixup("!" + translator.anyField(x, s"_is_valid_$attrName"))
    }
    out.puts(s"BOOST_CHECK($nullCheckStr);")
  }

  def trueArrayAssert(check: TestAssert, elType: DataType, elts: Seq[Ast.expr]): Unit = {
    val elTypeName = CCompiler.kaitaiType2NativeType(elType)
    val eltsStr = elts.map((x) => makeArrayPart(x)).mkString(", ")
    val actStr = translateAct(check.actual)
    out.puts(s"COMPARE_ARRAY($elTypeName, $actStr, $eltsStr);")
  }

  def makeArrayPart(e: Ast.expr) : String = {
    e match {
      case Ast.expr.Str(_) => s"ks_string_from_cstr(${translator.translate(e)})"
      case _ => translator.translate(e)
    }
  }

  override def indentStr: String = "    "

  override def results: String = {
    "// " + AUTOGEN_COMMENT + "\n\n" +
      "#define KS_USE_ZLIB\n" +
      "#define KS_DEPEND_ON_INTERNALS\n" +
      "extern \"C\" {\n" +
      "#include \"" + spec.id + ".h\"\n" +
      "}\n" +
      cppImportList.result + "\n" +
      out.result
  }

  def fixup(s: String) : String = s.replace("->" + Main.INIT_OBJ_NAME, "").replaceFirst("->", ".")

  def translateAct(x: Ast.expr) = {
    fixup(translator.translate(x))
  }
}
