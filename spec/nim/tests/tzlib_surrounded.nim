# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/zlib_surrounded
import ../test_utils

let r = ZlibSurrounded.fromFile("src/zlib_surrounded.bin")

test "ZlibSurrounded":

  check(r.zlib.inflated == int32(-1))
  discard
