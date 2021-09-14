#include <iostream>

inline bool operator==(const ks_string s1, const char* s2)
{
    return strcmp(s1.data, s2) == 0;
}

inline std::ostream& operator<<(std::ostream& out, const ks_string s)
{
    return out << s.data;
}
