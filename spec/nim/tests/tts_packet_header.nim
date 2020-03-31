# Autogenerated from KST: please remove this line if doing any edits by hand!

import os, streams, options, sequtils, unittest
import ../../../compiled/nim/ts_packet_header
import ../test_utils

let r = TsPacketHeader.fromFile("src/ts_packet.bin")

test "TsPacketHeader":

  check(r.syncByte == uint8(71))
  check(r.transportErrorIndicator == bool(false))
  check(r.payloadUnitStartIndicator == bool(false))
  check(r.transportPriority == bool(true))
  check(r.pid == uint64(33))
  check(r.transportScramblingControl == uint64(0))
  check(r.adaptationFieldControl == TsPacketHeader_AdaptationFieldControlEnum.payload_only)
  discard
