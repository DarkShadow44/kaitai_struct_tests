#include <kaitaistruct.h>
#include <iostream>
#include <sstream>

inline bool operator==(const ks_string s1, const char* s2)
{
    return strcmp(s1.data, s2) == 0;
}

inline std::ostream& operator<<(std::ostream& out, const ks_string s)
{
    return out << s.data;
}

inline bool operator==(const ks_bytes b1, const ks_bytes b2)
{
    uint8_t* data1;
    uint8_t* data2;
    uint64_t length1, length2;

    ks_bytes_get_length(&b1, &length1);
    ks_bytes_get_length(&b2, &length2);

    if (length1 != length2)
        return false;

    data1 = (uint8_t*)malloc(length1);
    data2 = (uint8_t*)malloc(length2);
    ks_bytes_get_data(&b1, data1);
    ks_bytes_get_data(&b2, data2);

    for (uint64_t i = 0; i < length1; i++)
    {
        if (data1[i] != data2[i])
        {
            free(data1);
            free(data2);
            return false;
        }
    }

    free(data1);
    free(data2);
    return true;
}

inline std::ostream& operator<<(std::ostream& out, const ks_bytes b)
{
    uint8_t* data;
    uint64_t length;
    std::stringstream ss;

    ks_bytes_get_length(&b, &length);
    data = (uint8_t*)malloc(length);
    ks_bytes_get_data(&b, data);

    bool first = true;
    for (uint64_t i = 0; i < length; i++)
    {
        if (!first)
            ss << ", ";
        ss << data[i];
        first = false;
    }
    free(data);

    return out << ss.str();
}

#define COMPARE_ARRAY(typ, act, ...)            \
    {                                           \
        typ temp1[] = {__VA_ARGS__};            \
        std::vector<typ> temp2(                 \
            temp1,                              \
            temp1 + sizeof(temp1) / sizeof(typ) \
        );                                      \
        BOOST_CHECK_EQUAL_COLLECTIONS(          \
            act->begin(), act->end(),           \
            temp2.begin(), temp2.end()          \
        );                                      \
    }
