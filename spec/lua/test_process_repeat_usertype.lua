-- Autogenerated from KST: please remove this line if doing any edits by hand!

local luaunit = require("luaunit")

require("process_repeat_usertype")

TestProcessRepeatUsertype = {}

function TestProcessRepeatUsertype:test_process_repeat_usertype()
    local r = ProcessRepeatUsertype:from_file("src/process_xor_4.bin")

    luaunit.assertEquals(r.blocks[1].a, -1975704206)
    luaunit.assertEquals(r.blocks[1].b, 20)
    luaunit.assertEquals(r.blocks[2].a, 279597642)
    luaunit.assertEquals(r.blocks[2].b, 68)
end
