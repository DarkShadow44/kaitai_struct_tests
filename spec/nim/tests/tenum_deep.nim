# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/enum_deep
import ../test_utils

let r = EnumDeep.fromFile("src/enum_0.bin")

test "EnumDeep":

  check(r.pet1 == EnumDeep_Container1_Animal.cat)
  check(r.pet2 == EnumDeep_Container1_Container2_Animal.hare)
  discard
