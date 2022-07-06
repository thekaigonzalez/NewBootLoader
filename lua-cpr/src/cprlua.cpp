#include <lua5.4/lua.hpp>
#include <lua5.4/lauxlib.h>
#include <lua5.4/lualib.h>

#ifdef NET_ENABLED
#include <cpr/cpr.h>
#endif

#if !defined(NET_ENABLED)
#error "Lib CPR C++ Is not installed. Network features are not going to be available."ADJ_OFFSET_SINGLESHOT
#endif

#include <iostream>

#ifdef NET_ENABLED
int gRString(lua_State* L)
{
    std::string string = luaL_checkstring(L, 1);
    auto a  = cpr::Get(cpr::Url(string));
    lua_pushstring(L, a.text.c_str());
    return 1;
}
int gDownload(lua_State* L)
{
    std::string string = luaL_checkstring(L, 1);
    std::string file = luaL_checkstring(L, 2);
    auto a  = cpr::Get(cpr::Url(string));
    std::ofstream file_t(file);
    file_t << a.text << "\n";
    file_t.close();
    return 1;
}
extern "C" {
    int luaopen_libhttp(lua_State *L) {

        lua_register(L, "download_string", gRString);
        lua_register(L, "download_file", gDownload);
        return 1;
    }
}

#endif