cmake_minimum_required(VERSION 3.4)
set(CMAKE_MESSAGE_LOG_LEVEL "WARNING")
set(EXECUTABLE_OUTPUT_PATH "bin")
project(echo)

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
    set(CMAKE_C_FLAGS "${WINDOWS_C_FLAGS}")
else()
    set(UNIX_C_FLAGS "${CMAKE_C_FLAGS} -O3 -Werror")
    set(GNU_C_FLAGS "${UNIX_C_FLAGS} -std=gnu17 -Wextra -Wall -pedantic")
    set(LLVM_FLAGS "-Wmost")
    set(CLANG_C_FLAGS "${GNU_C_FLAGS} ${LLVM_FLAGS}")

    if(CMAKE_C_COMPILER_ID MATCHES "Clang")
        set(CMAKE_C_FLAGS "${CLANG_C_FLAGS}")

        if(NOT CMAKE_SYSTEM_NAME MATCHES "Darwin")
            set(CMAKE_C_CLANG_TIDY clang-tidy -header-filter=${CMAKE_SOURCE_DIR})
        endif()
    else()
        set(CMAKE_C_FLAGS "${GNU_C_FLAGS}")
    endif()
endif()

add_executable(echo src/cmd/echo/main.c)

if(MSVC)
    set(HOME "$ENV{HOMEDRIVE}$ENV{HOMEPATH}")
    set(ARTIFACT echo.exe)
else()
    set(HOME "$ENV{HOME}")
    set(ARTIFACT echo)
endif()

file(TO_NATIVE_PATH "${HOME}/bin" INSTALL_DIR)
file(TO_NATIVE_PATH "${INSTALL_DIR}/${ARTIFACT}" INSTALL_FILE)

install(PROGRAMS $<TARGET_FILE:echo> DESTINATION "${INSTALL_DIR}")

if(MSVC)
    add_custom_target(uninstall COMMAND del /s /q "${INSTALL_FILE}")
else()
    add_custom_target(uninstall COMMAND rm -f "${INSTALL_FILE}")
endif()

enable_testing()

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

add_custom_target(valgrind DEPENDS)

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