# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/expr_sizeof_type_1
import ../test_utils

let r = ExprSizeofType1.fromFile("src/fixed_struct.bin")

test "ExprSizeofType1":

  check(r.sizeofBlock == int((((1 + 4) + 2) + 4)))
  check(r.sizeofSubblock == int(4))
  discard
