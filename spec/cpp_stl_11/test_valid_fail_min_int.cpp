// Autogenerated from KST: please remove this line if doing any edits by hand!

#include <boost/test/unit_test.hpp>
#include <valid_fail_min_int.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <kaitai/exceptions.h>

BOOST_AUTO_TEST_CASE(test_valid_fail_min_int) {
    std::ifstream ifs("src/fixed_struct.bin", std::ifstream::binary);
    kaitai::kstream ks(&ifs);
    valid_fail_min_int_t* r = nullptr;
    BOOST_CHECK_THROW(
        r = new valid_fail_min_int_t(&ks),
        kaitai::validation_less_than_error<uint8_t>
    );

    delete r;
}
