cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

message(STATUS "import IKInit.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/IKConfig.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/IKPackage.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/IKBuild.cmake")
set(IKCMAKE_VERSION 0.2.0)

macro(IK_InitProject PROJECT_NAME_STR)
    set(CMAKE_DEBUG_POSTFIX d)
    
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED True)

    set(PROJECT_NAME ${PROJECT_NAME_STR})
    IK_InitConfig()
    # The version number.
    set (${PROJECT_NAME}_VERSION_MAJOR 1)
    set (${PROJECT_NAME}_VERSION_MINOR 0)
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17") # 添加c++17标准支持
    endif()
    set (EXECUTABLE_OUTPUT_PATH "${PROJECT_SOURCE_DIR}/bin") # 可执行文件输出目录

    if(NOT IK_RootProjectPath)
        set(IK_RootProjectPath ${PROJECT_SOURCE_DIR})
    endif()

    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${IK_RootProjectPath}/bin")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG "${IK_RootProjectPath}/bin")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE "${IK_RootProjectPath}/bin")
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/lib")
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG "${PROJECT_SOURCE_DIR}/lib")
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${PROJECT_SOURCE_DIR}/lib")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/lib")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG "${PROJECT_SOURCE_DIR}/lib")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE "${PROJECT_SOURCE_DIR}/lib")


    # CPack
    # set(CPACK_PROJECT_NAME ${PROJECT_NAME})
    # set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
    # include(CPack)

    set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endmacro(IK_InitProject PROJECT_NAME_STR)


