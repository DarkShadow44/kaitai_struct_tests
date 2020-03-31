# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/if_values
import ../test_utils

let r = IfValues.fromFile("src/fixed_struct.bin")

test "IfValues":

  check(r.codes[0].opcode == uint8(80))
  check(r.codes[0].halfOpcode == int(40))
  check(r.codes[1].opcode == uint8(65))
  check(r.codes[1].halfOpcode == none(typeof(r.codes[1].halfOpcode)))
  check(r.codes[2].opcode == uint8(67))
  check(r.codes[2].halfOpcode == none(typeof(r.codes[2].halfOpcode)))
  discard
