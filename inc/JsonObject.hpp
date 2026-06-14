#ifndef _JSONOBJECT_HPP_
#define _JSONOBJECT_HPP_
#include <map>
#include <string>

class JsonObject
{
    public:
        JsonObject();
        ~JsonObject();
        std::string get(const std::string& key) const;
        void insert(const std::string& key, const std::string& value);
    private:
        std::map<std::string, std::string> data;
};

#endif