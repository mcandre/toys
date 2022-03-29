#include <cstdlib>

#include <filesystem>
#include <functional>
#include <iostream>
#include <string_view>
#include <map>
#include <unordered_set>
#include <vector>

using std::literals::string_view_literals::operator""sv;

static int cmake_init() {
    return system("cmake .");
}

static int lint() {
    const int status{ cmake_init() };

    if (status) {
        return status;
    }

    return system("cmake --build . --target lint");
}

static int build() {
    const int status{ cmake_init() };

    if (status) {
        return status;
    }

    return system("cmake --build . --config Release");
}

static int install() {
    const int status{ build() };

    if (status) {
        return status;
    }

    return system("cmake --build . --target install");
}

static int uninstall() {
    const int status{ cmake_init() };

    if (status) {
        return status;
    }

    return system("cmake --build . --target uninstall");
}

static int leaks() {
    const int status{ install() };

    if (status) {
        return status;
    }

    return system("cmake --build . --target leaks");
}

static int clean_bin() {
    std::filesystem::remove_all("bin");
    return EXIT_SUCCESS;
}

static int clean_msvc() {
    std::filesystem::remove_all("x64");
    std::filesystem::remove_all("x86");

    const std::unordered_set<std::string> junk_extensions{
        ".dir",
        ".filters",
        ".obj",
        ".sln",
        ".vcxproj"
    };

    for (const std::filesystem::directory_entry &child : std::filesystem::directory_iterator(std::filesystem::current_path())) {
        const std::filesystem::path child_path{ child.path() };

        if (junk_extensions.find(child_path.extension().string()) != junk_extensions.end()) {
            std::filesystem::remove_all(child_path);
        }
    }

    return EXIT_SUCCESS;
}

static int clean_cmake() {
    std::filesystem::remove_all("install_manifest.txt");
    std::filesystem::remove_all("Makefile");
    std::filesystem::remove_all("CMakeFiles");
    std::filesystem::remove_all("CMakeCache.txt");
    std::filesystem::remove_all("cmake_install.cmake");
    std::filesystem::remove_all("CTestTestfile.cmake");
    std::filesystem::remove_all("Testing");
    return EXIT_SUCCESS;
}

static int clean() {
    clean_bin();
    clean_msvc();
    clean_cmake();
    return EXIT_SUCCESS;
}

int main(int argc, const char **argv) {
    const std::vector<std::string_view> args{ argv + 1, argv + argc };
    const std::function<int()> default_task{ install };

    if (args.empty()) {
        if (default_task()) {
            return EXIT_FAILURE;
        }

        return EXIT_SUCCESS;
    }

    const std::map<std::string_view, std::function<int()>> tasks{
        { "clean"sv, clean },
        { "clean_bin"sv, clean_bin },
        { "clean_cmake"sv, clean_cmake },
        { "clean_msvc"sv, clean_msvc },
        { "cmake_init"sv, cmake_init },
        { "lint"sv, lint },
        { "build"sv, build },
        { "install"sv, install },
        { "leaks"sv, leaks },
        { "uninstall"sv, uninstall }
    };

    if (args.front() == "-l") {
        for (const auto &[name, _] : tasks) {
            std::cout << name << std::endl;
        }

        return EXIT_SUCCESS;
    }

    for (const std::string_view &arg : args) {
        try {
            const std::function<int()> f{ tasks.at(arg) };

            if (f()) {
                return EXIT_FAILURE;
            }
        } catch (std::out_of_range &e) {
            std::cerr << "no such task: " << arg << std::endl;
            return EXIT_FAILURE;
        }
    }

    return EXIT_SUCCESS;
}
