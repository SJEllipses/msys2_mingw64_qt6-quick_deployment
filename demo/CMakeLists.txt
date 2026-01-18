cmake_minimum_required(VERSION 3.16)
project(demo LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(WIN32)
    set(CMAKE_WIN32_EXECUTABLE ON)
endif()

find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick)

add_executable(demo main.cpp qml.qrc)

target_link_libraries(demo PRIVATE Qt6::Core Qt6::Gui Qt6::Quick)