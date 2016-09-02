<?php
namespace Kaitai\Struct\Tests;

class InstanceIoUserTest extends TestCase {
    public function testInstanceIoUser() {
        $r = InstanceIoUser::fromFile(self::SRC_DIR_PATH . "/instance_io.bin");

        $this->assertEquals(3, $r->qtyEntries());

        $this->assertEquals("the", $r->entries()[0]->name());
        $this->assertEquals("rainy", $r->entries()[1]->name());
        $this->assertEquals("day it is", $r->entries()[2]->name());
    }
}
