// Autogenerated from KST: please remove this line if doing any edits by hand!

package io.kaitai.struct.spec;

import io.kaitai.struct.testformats.ValidFailEqBytes;
import org.testng.annotations.Test;
import static org.testng.Assert.*;
import io.kaitai.struct.KaitaiStream;
public class TestValidFailEqBytes extends CommonSpec {

    @Test(expectedExceptions = KaitaiStream.ValidationNotEqualError.class)
    public void testValidFailEqBytes() throws Exception {
        ValidFailEqBytes r = ValidFailEqBytes.fromFile(SRC_DIR + "fixed_struct.bin");

    }
}
