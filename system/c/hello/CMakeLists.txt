cmake_minimum_required(VERSION 3.4)
set(CMAKE_MESSAGE_LOG_LEVEL "WARNING")
set(EXECUTABLE_OUTPUT_PATH "bin")
project(hello)

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
elseif(CMAKE_C_COMPILER_ID MATCHES "Clang")
    set(CPPFLAGS "${CPPFLAGS} -Wmost")

    if(NOT CMAKE_SYSTEM_NAME MATCHES "Darwin")
        set(CMAKE_C_CLANG_TIDY clang-tidy -header-filter=${CMAKE_SOURCE_DIR})
    endif()
endif()

add_executable(hello src/cmd/hello/main.c)

if(MSVC)
    set(HOME "$ENV{HOMEDRIVE}$ENV{HOMEPATH}")
    set(ARTIFACT hello.exe)
else()
    set(HOME "$ENV{HOME}")
    set(ARTIFACT hello)
endif()

file(TO_NATIVE_PATH "${HOME}/bin" INSTALL_DIR)
file(TO_NATIVE_PATH "${INSTALL_DIR}/${ARTIFACT}" INSTALL_FILE)

install(PROGRAMS $<TARGET_FILE:hello> DESTINATION "${INSTALL_DIR}")

if(MSVC)
    add_custom_target(uninstall COMMAND del /s /q "${INSTALL_FILE}")
else()
    add_custom_target(uninstall COMMAND rm -f "${INSTALL_FILE}")
endif()

enable_testing()
add_test(NAME hello_unit_test COMMAND bin/hello)

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

add_custom_target(valgrind_test COMMAND valgrind --error-exitcode=1 --leak-check=full bin/hello)
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
