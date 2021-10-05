#ifndef CUSTOM_FX_H_
#define CUSTOM_FX_H_

#include <kaitaistruct.h>

namespace nested_t {
namespace deeply_t {

class custom_fx_t : public kaitai::custom_decoder {
public:
    custom_fx_t(int p_key);
    std::string decode(std::string src);
};

}
}

#endif  // CUSTOM_FX_H_
