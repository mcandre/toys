#include <cstdlib>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <string>
#include <vector>

#include "sha2/sha2.hpp"

static void usage(const std::string &program) {
    std::cerr << "Usage: " << program << " <path>" << std::endl;
}

int main(int argc, char **argv) {
    const std::vector<std::string> args{ argv, argv + argc };

    if (args.empty()) {
        std::cerr << "error: missing program name" << std::endl;
        return EXIT_FAILURE;
    }

    if (args.size() < 2) {
        usage(args[0]);
        return EXIT_FAILURE;
    }

    const std::string path{args[1]};
    sha2::SHA2 digest{};

    try {
        digest.Encrypt(path);

        for (const auto h : digest.hash) {
            std::cout <<
                std::hex <<
                std::noshowbase <<
                std::setw(8) <<
                std::setfill('0') <<
                h;
        }

        std::cout << "  " << path << std::endl;
        return EXIT_SUCCESS;
    } catch (const std::exception &e) {
        std::cerr << e.what() << std::endl;
        return EXIT_FAILURE;
    }
}
