# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/process_xor_value
import ../test_utils

let r = ProcessXorValue.fromFile("src/process_xor_1.bin")

test "ProcessXorValue":

  check(r.key == uint8(255))
  check(r.buf == string(@[102'u8, 111, 111, 32, 98, 97, 114].toString))
  discard
