#include <kaitaistruct.h>

static ks_bytes* custom_fx_no_args_decode(void*userdata, ks_bytes* src) {
    int length = ks_bytes_get_length(src);
    char* data = calloc(1, length + 3);
    ks_bytes_get_data(src + 1, data);

    data[0] = '_';
    data[length + 1] = '_';

    return ks_bytes_create(data, length + 2);
}

ks_custom_decoder custom_fx_no_args_create(void) {
    ks_custom_decoder ret = {0};
    ret.decode = custom_fx_no_args_decode;
    return ret;
}

/*
#include "custom_fx.h"

nested_t::deeply_t::custom_fx_t::custom_fx_t(int p_key) {
}

std::string nested_t::deeply_t::custom_fx_t::decode(std::string src) {
    return "_" + src + "_";
}


#include "my_custom_fx.h"

my_custom_fx_t::my_custom_fx_t(int p_key, bool p_flag, std::string p_some_bytes) {
    key = p_flag ? p_key : -p_key;
}

std::string my_custom_fx_t::decode(std::string src) {
    int len = src.length();
    std::string dst(len, ' ');

    for (int i = 0; i < len; i++)
        dst[i] = src[i] + key;

    return dst;
}

my_custom_fx_t::my_custom_fx_t(int p_key, bool p_flag, std::string p_some_bytes) {
    key = p_flag ? p_key : -p_key;
}

std::string my_custom_fx_t::decode(std::string src) {
    int len = src.length();
    std::string dst(len, ' ');

    for (int i = 0; i < len; i++)
        dst[i] = src[i] + key;

    return dst;
}
*/
