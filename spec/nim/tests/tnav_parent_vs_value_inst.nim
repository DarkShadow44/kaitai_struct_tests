# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/nav_parent_vs_value_inst
import ../test_utils

let r = NavParentVsValueInst.fromFile("src/term_strz.bin")

test "NavParentVsValueInst":

  check(r.s1 == string("foo"))
  discard
