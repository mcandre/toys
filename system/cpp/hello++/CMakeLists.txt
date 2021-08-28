cmake_minimum_required(VERSION 3.4)
set(CMAKE_MESSAGE_LOG_LEVEL "WARNING")
set(EXECUTABLE_OUTPUT_PATH "bin")
project(hello++)

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

    set(WINDOWS_C_FLAGS "${CMAKE_C_FLAGS} /INCREMENTAL:NO /std:c17 /Ox /WX /W4 /wd4204")
    set(WINDOWS_CXX_FLAGS "${CMAKE_CXX_FLAGS} /INCREMENTAL:NO /std:c++17 /Ox /WX /W4 /wd4204")
    set(CMAKE_C_FLAGS "${WINDOWS_C_FLAGS}")
    set(CMAKE_CXX_FLAGS "${WINDOWS_CXX_FLAGS}")
else()
    set(UNIX_C_FLAGS "${CMAKE_C_FLAGS} -O3 -Werror")
    set(UNIX_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -Werror")
    set(GNU_C_FLAGS "${UNIX_C_FLAGS} -std=gnu17 -Wextra -Wall -pedantic")
    set(GNU_CXX_FLAGS "${UNIX_CXX_FLAGS} -std=c++17 -Wextra -Wall -pedantic -Weffc++")
    set(LLVM_FLAGS "-Wmost")
    set(CLANG_C_FLAGS "${GNU_C_FLAGS} ${LLVM_FLAGS}")
    set(CLANG_CXX_FLAGS "${GNU_CXX_FLAGS} ${LLVM_FLAGS}")

    if(CMAKE_C_COMPILER_ID MATCHES "Clang")
        set(CMAKE_C_FLAGS "${CLANG_C_FLAGS}")
        set(CMAKE_CXX_FLAGS "${CLANG_CXX_FLAGS}")

        if(NOT CMAKE_SYSTEM_NAME MATCHES "Darwin")
            set(CMAKE_C_CLANG_TIDY clang-tidy -header-filter=${CMAKE_SOURCE_DIR})
            set(CMAKE_CXX_CLANG_TIDY clang-tidy -header-filter=${CMAKE_SOURCE_DIR})
        endif()
    else()
        set(CMAKE_C_FLAGS "${GNU_C_FLAGS}")
        set(CMAKE_CXX_FLAGS "${GNU_CXX_FLAGS}")
    endif()
endif()

add_executable(hello++ src/cmd/hello++/main.cpp)

enable_testing()
add_test(NAME hello_unit_test COMMAND bin/hello++)

add_custom_target(cppcheck COMMAND cppcheck -q --force --enable=all --inline-suppr --suppressions-list=suppressions.cfg --error-exitcode=1 src)
add_custom_target(cpplint COMMAND sail src | xargs -n 1 cpplint)
add_custom_target(vera++ COMMAND sail src | xargs -n 1 vera++)
add_custom_target(clang-format COMMAND sail src | xargs -n 1 clang-format -i)

# Missing linter ports
if(MSVC)
    add_custom_target(lint DEPENDS cppcheck)
else()
    add_custom_target(lint DEPENDS cppcheck cpplint vera++ clang-format)
endif()

add_custom_target(valgrind_test COMMAND valgrind --error-exitcode=1 --leak-check=full bin/hello++)
add_custom_target(valgrind DEPENDS valgrind_test)

# Broken or missing valgrind
if(
    MSVC OR
    CMAKE_C_COMPILER MATCHES "aarch64" OR
    CMAKE_SYSTEM_NAME MATCHES "FreeBSD" OR
    CMAKE_SYSTEM_NAME MATCHES "Darwin"
)
    add_custom_target(leaks)
else()
    add_custom_target(leaks DEPENDS valgrind)
endif()

add_custom_target(doc COMMAND doxygen Doxyfile)
add_custom_target(clean-cmake COMMAND sh clean-cmake.sh)
