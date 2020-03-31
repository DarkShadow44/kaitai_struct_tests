# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/instance_std_array
import ../test_utils

let r = InstanceStdArray.fromFile("src/instance_std_array.bin")

test "InstanceStdArray":

  check(r.ofs == uint32(16))
  check(r.qtyEntries == uint32(3))
  check(r.entrySize == uint32(4))
  check(len(r.entries) == int(3))
  check(r.entries[0] == string(@[17'u8, 17, 17, 17].toString))
  check(r.entries[1] == string(@[34'u8, 34, 34, 34].toString))
  check(r.entries[2] == string(@[51'u8, 51, 51, 51].toString))
  discard
