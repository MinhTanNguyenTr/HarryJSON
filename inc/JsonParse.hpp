#ifndef JSON_PARSE_HPP_
#define JSON_PARSE_HPP_
#include "JsonObject.hpp"

class JsonParse
{
    public:
        JsonParse();
        ~JsonParse();
        JsonObject parse(const std::string& jsonString);
};
#endif