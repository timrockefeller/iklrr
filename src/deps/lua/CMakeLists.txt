project(lua C)
cmake_minimum_required(VERSION 3.11)

set(SRC_CORE 
    lapi.c
    lcode.c
    ldebug.c
    ldo.c
    ldump.c
    lfunc.c
    lgc.c
    llex.c
    lmem.c
    lobject.c
    lopcodes.c
    lparser.c
    lstate.c
    lstring.c
    ltable.c
    ltm.c
    lundump.c
    lvm.c
    lzio.c)
    
set(SRC_LIB
    lauxlib.c
    lbaselib.c
    ldblib.c
    liolib.c
    lmathlib.c
    loslib.c
    lstrlib.c
    ltablib.c
    loadlib.c
    linit.c)

set(SRC_LUA lua.c)


add_library(liblua ${SRC_CORE} ${SRC_LIB})
set_target_properties(liblua PROPERTIES OUTPUT_NAME lua)
target_include_directories(liblua PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_library(libluadll SHARED ${SRC_CORE} ${SRC_LIB})
target_compile_definitions(libluadll PRIVATE _CRT_SECURE_NO_WARNINGS LUA_BUILD_AS_DLL)
set_target_properties(libluadll PROPERTIES OUTPUT_NAME lua51)
target_include_directories(libluadll PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

add_executable(lua ${SRC_LUA})
target_link_libraries(lua libluadll)
target_include_directories(lua PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})