# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/params_call_extra_parens
import ../test_utils

let r = ParamsCallExtraParens.fromFile("src/term_strz.bin")

test "ParamsCallExtraParens":

  check(r.buf1.body == string("foo|b"))
  discard
