cmake_minimum_required(VERSION 3.4)
enable_testing()

project(magic)

set(EXECUTABLE_OUTPUT_PATH "bin")
set(LSB_RELEASE "")
set(ETC_RELEASE "")

if(MSVC)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${EXECUTABLE_OUTPUT_PATH}")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG "${EXECUTABLE_OUTPUT_PATH}")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE "${EXECUTABLE_OUTPUT_PATH}")
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${EXECUTABLE_OUTPUT_PATH}")
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG "${EXECUTABLE_OUTPUT_PATH}")
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${EXECUTABLE_OUTPUT_PATH}")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${EXECUTABLE_OUTPUT_PATH}")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG "${EXECUTABLE_OUTPUT_PATH}")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE "${EXECUTABLE_OUTPUT_PATH}")
elseif(CMAKE_SYSTEM_NAME MATCHES "Linux")
    execute_process(COMMAND lsb_release -a OUTPUT_VARIABLE LSB_RELEASE)
    execute_process(COMMAND cat /etc/*release* OUTPUT_VARIABLE ETC_RELEASE)
endif()

set(WINDOWS_C_FLAGS "${CMAKE_C_FLAGS} /O2 /WX /W4 /wd4204")

set(UNIX_C_FLAGS "${CMAKE_C_FLAGS} -O2 -Werror")
set(GNU_C_FLAGS "${UNIX_C_FLAGS} -std=gnu99 -Wextra -Wall -pedantic")
set(CLANG_C_FLAGS "${GNU_C_FLAGS} -Wmost -Weverything")

if(MSVC)
    set(CMAKE_C_FLAGS "${WINDOWS_C_FLAGS}")
elseif("$ENV{CLOUD_ABI_TRIPLET}" MATCHES "cloudabi")
    set(CMAKE_C_FLAGS "${UNIX_C_FLAGS}")
elseif(CMAKE_C_COMPILER_ID MATCHES "Clang")
    set(CMAKE_C_COMPILER "clang")
    set(CMAKE_C_FLAGS "${CLANG_C_FLAGS}")
elseif(CMAKE_C_COMPILER_ID MATCHES "GNU")
    set(CMAKE_C_FLAGS "${GNU_C_FLAGS}")
else()
    set(CMAKE_C_FLAGS "${UNIX_C_FLAGS}")
endif()

add_executable(magic lib/magic.c)

add_test(NAME magic_unit_test COMMAND bin/magic)

add_custom_target(cppcheck COMMAND cppcheck -q --enable=all --inline-suppr --suppressions-list=suppressions.cfg -DX_PATH_MAX=1024 --error-exitcode=1 lib)
add_custom_target(cpplint COMMAND sail lib | xargs -n 1 cpplint)
add_custom_target(vera++ COMMAND sail lib | xargs -n 1 vera++)

# Missing linter ports
if(
    CMAKE_SYSTEM_NAME MATCHES "Haiku" OR
    CMAKE_SYSTEM_NAME MATCHES "MirBSD" OR
    CMAKE_SYSTEM_NAME MATCHES "SunOS" OR
    CMAKE_SYSTEM_NAME MATCHES "Minix" OR
    "${CMAKE_GNU_C_MACHINE}" MATCHES "uclibc"
)
    add_custom_target(lint DEPENDS)
elseif(MSVC)
    add_custom_target(lint DEPENDS cppcheck)
elseif(CMAKE_SYSTEM_VERSION MATCHES "HBSD")
    add_custom_target(lint DEPENDS cpplint)
elseif(
    CMAKE_SYSTEM_NAME MATCHES "OpenBSD" OR
    CMAKE_SYSTEM_VERSION MATCHES "gentoo" OR
    LSB_RELEASE MATCHES "Void"
)
    add_custom_target(lint DEPENDS cppcheck cpplint)
else()
    add_custom_target(lint DEPENDS cppcheck cpplint vera++)
endif()

add_custom_target(valgrind_test COMMAND valgrind --error-exitcode=1 --leak-check=full bin/magic)
add_custom_target(valgrind DEPENDS valgrind_test)

# Broken or missing valgrind
if(
    MSVC OR
    "$ENV{CC}" MATCHES "aarch64" OR
    "$ENV{CC}" MATCHES "alpha" OR
    "$ENV{CC}" MATCHES "arm" OR
    "$ENV{CC}" MATCHES "hppa" OR
    "$ENV{CC}" MATCHES "mips" OR
    "$ENV{CC}" MATCHES "powerpc" OR
    "$ENV{CC}" MATCHES "riscv" OR
    "$ENV{CC}" MATCHES "sparc" OR
    "$ENV{CC}" MATCHES "x32" OR
    CMAKE_SYSTEM_NAME MATCHES "DragonFly" OR
    CMAKE_SYSTEM_NAME MATCHES "FreeBSD" OR
    CMAKE_SYSTEM_NAME MATCHES "Haiku" OR
    CMAKE_SYSTEM_VERSION MATCHES "HBSD" OR
    CMAKE_SYSTEM_NAME MATCHES "SunOS" OR
    CMAKE_SYSTEM_NAME MATCHES "Darwin" OR
    CMAKE_SYSTEM_NAME MATCHES "Minix" OR
    CMAKE_SYSTEM_NAME MATCHES "MirBSD" OR
    CMAKE_SYSTEM_NAME MATCHES "NetBSD" OR
    LSB_RELEASE MATCHES "Void" OR
    CMAKE_SYSTEM_NAME MATCHES "OpenBSD" OR
    "${CMAKE_GNU_C_MACHINE}" MATCHES "uclibc"
)
    add_custom_target(leaks)
else()
    add_custom_target(leaks DEPENDS valgrind)
endif()

add_custom_target(clean-cmake COMMAND sh clean-cmake.sh)
