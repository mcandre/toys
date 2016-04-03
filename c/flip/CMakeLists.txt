cmake_minimum_required(VERSION 3.4)

project(flip)
set(EXECUTABLE_OUTPUT_PATH "bin")
add_executable(flip lib/flip.c)
set(CMAKE_C_FLAGS "-O2 -Wall -Wextra -Wmost -Weverything")

enable_testing()
add_test(NAME fliptest COMMAND flip test.txt && flip test.txt.flip && md5 test.txt test.txt.bak)

add_custom_target(cppcheck COMMAND cppcheck -q --enable=all --suppressions-list=$ENV{HOME}/suppressions.cfg lib)
add_custom_target(splint COMMAND find lib -type f -name '*.[ch]' -exec splint {} "\;")
add_custom_target(vera++ COMMAND find lib -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} "\;")
add_custom_target(lint DEPENDS cppcheck splint vera++)

add_custom_target(valgrind COMMAND valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes $<TARGET_FILE:flip> test.txt)
