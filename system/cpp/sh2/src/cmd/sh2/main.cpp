#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <string>

#include "sh2/sh2.hpp"

static void usage(const char *program) {
    std::cerr << "usage: " << program << " <path>" << std::endl;
}

int main(int argc, char **argv) {
    if (argc != 2) {
        usage(argv[0]);
        return EXIT_FAILURE;
    }

    const std::string path{argv[1]};
    sh2::SH2 digest{};

    try {
        digest.Encrypt(path);

        for (const uint32_t h : digest.hash) {
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
