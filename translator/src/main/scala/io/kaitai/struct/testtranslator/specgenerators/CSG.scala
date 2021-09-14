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

  cppImportList.addSystem("boost/test/unit_test.hpp")
  cppImportList.addLocal(s"${spec.id}.h")
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
    cppImportList.addKaitai("kaitai/exceptions.h")

    runParseCommon1()
    out.puts(s"BOOST_CHECK_EQUAL(error == 0, 0);")
  }

  def runParseCommon1(): Unit = {
    out.puts(s"ksx_$className data;")
    out.puts("ks_stream stream;")
    out.puts("int error;")
    out.puts("FILE* file = fopen(\"src/" + spec.data + "\", \"r\");")
    out.puts("ks_stream_init_from_file(&stream, file);")
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
        translateAct(x) + s"->_is_null_$attrName()"
    }
    out.puts(s"BOOST_CHECK($nullCheckStr);")
  }

  def trueArrayAssert(check: TestAssert, elType: DataType, elts: Seq[Ast.expr]): Unit = {
    cppImportList.addLocal("helpers.h")
    val elTypeName = CCompiler.kaitaiType2NativeType(elType)
    val eltsStr = elts.map((x) => translator.translate(x)).mkString(", ")
    val actStr = translateAct(check.actual)
    out.puts(s"COMPARE_ARRAY($elTypeName, $actStr, $eltsStr);")
  }

  override def indentStr: String = "    "

  override def results: String = {
    "// " + AUTOGEN_COMMENT + "\n\n" +
      cppImportList.result + "\n" +
      out.result
  }

  def translateAct(x: Ast.expr) = {
    out.puts("//" + x.toString())
    translator.translate(x).replace(Main.INIT_OBJ_NAME + "->", "").replaceFirst("->", ".")
  }
}
