# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/params_enum
import ../test_utils

let r = ParamsEnum.fromFile("src/enum_0.bin")

test "ParamsEnum":

  check(r.one == ParamsEnum_Animal.cat)
  check(r.invokeWithParam.isCat == bool(true))
  discard
