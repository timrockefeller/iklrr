#include "sol/sol.hpp"

bool create_vm()
{
    sol::state lua;
    lua.open_libraries(sol::lib::base);
    
    lua.script_file("../assets/scripts/class.lua");


const auto& my_script = R"(

    local a = Class()
    print (a)

)";

    lua.script(my_script);

    return true;
}