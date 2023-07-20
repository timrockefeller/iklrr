
#include "sol/sol.hpp"
int main()
{

    sol::state lua;
    lua.open_libraries(sol::lib::base, sol::lib::package);
    lua.script(R"(package.path=package.path..";../assets/scripts/?.lua")");
    lua.script_file("../assets/scripts/class.lua");
    lua.script_file("../assets/scripts/test.lua");
    return 0;
}