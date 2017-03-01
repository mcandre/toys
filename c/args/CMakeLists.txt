cmake_minimum_required(VERSION 3.4)

project(args)
set(EXECUTABLE_OUTPUT_PATH "bin")
set(CMAKE_C_FLAGS "-O2 -Wall -Wextra -pedantic -std=c99")
if (CMAKE_C_COMPILER_ID MATCHES "Clang")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wmost -Weverything")
endif()
add_executable(args lib/args.c)

enable_testing()
add_test(NAME argstest COMMAND args a b c)

add_custom_target(cppcheck COMMAND cppcheck -q --enable=all --suppressions-list=$ENV{HOME}/suppressions.cfg lib)
add_custom_target(splint COMMAND find lib -type f -name '*.[ch]' -exec splint {} "\;")
add_custom_target(vera++ COMMAND find lib -type f -name '*.cpp' -o -name '*.[ch]' -exec vera++ -s {} "\;")
add_custom_target(lint DEPENDS cppcheck splint vera++)

add_custom_target(valgrind COMMAND valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --track-fds=yes --dsymutil=yes $<TARGET_FILE:args> a b c)
