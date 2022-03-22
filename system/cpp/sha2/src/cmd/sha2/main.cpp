/**
 * @copyright 2021 YelloSoft
 */

#include <cstdlib>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <string>
#include <string_view>
#include <vector>

#include "sha2/sha2.hpp"

/**
 * @brief Usage emits operational documentation.
 *
 * @param program the invoked name of this program
 */
static void Usage(const std::string_view &program) {
    std::cerr << "Usage: " << program << " <path>" << std::endl;
}

/**
 * @brief main is the entrypoint.
 *
 * @param argc argument count
 * @param argv CLI arguments
 * @returns CLI exit code
 */
int main(int argc, const char **argv) {
    const std::vector<std::string_view> args{ argv, argv + argc };

    if (args.empty()) {
        std::cerr << "error: missing program name" << std::endl;
        return EXIT_FAILURE;
    }

    if (args.size() < 2) {
        Usage(args[0]);
        return EXIT_FAILURE;
    }

    const std::string path{ args[1] };
    sha2::SHA2 digest{};

    try {
        digest.Encrypt(path);

        for (const auto h : digest.hash) {
            std::cout << std::hex << std::noshowbase << std::setw(8) << std::setfill('0') << h;
        }

        std::cout << "  " << path << std::endl;
        return EXIT_SUCCESS;
    } catch (const std::exception &e) {
        std::cerr << e.what() << std::endl;
        return EXIT_FAILURE;
    }
}
