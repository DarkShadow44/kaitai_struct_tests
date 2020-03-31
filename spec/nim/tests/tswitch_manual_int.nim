# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/switch_manual_int
import ../test_utils

let r = SwitchManualInt.fromFile("src/switch_opcodes.bin")

test "SwitchManualInt":

  check(len(r.opcodes) == int(4))
  check(r.opcodes[0].code == uint8(83))
  check((SwitchManualInt_Opcode_Strval(r.opcodes[0].body)).value == string("foobar"))
  check(r.opcodes[1].code == uint8(73))
  check((SwitchManualInt_Opcode_Intval(r.opcodes[1].body)).value == uint8(66))
  check(r.opcodes[2].code == uint8(73))
  check((SwitchManualInt_Opcode_Intval(r.opcodes[2].body)).value == uint8(55))
  check(r.opcodes[3].code == uint8(83))
  check((SwitchManualInt_Opcode_Strval(r.opcodes[3].body)).value == string(""))
  discard
