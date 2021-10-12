#include <cstdlib>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <string>

#include "sha2/sha2.hpp"

static void usage(const char *program) {
    std::cerr << "usage: " << program << " <path>" << std::endl;
}

int main(int argc, char **argv) {
    if (argc != 2) {
        usage(argv[0]);
        return EXIT_FAILURE;
    }

    const std::string path{argv[1]};
    sha2::SHA2 digest{};
    uint8_t sum[32] = { 0 };

    try {
        digest.Encrypt(path);
        (void) memcpy(sum, digest.hash, 32);

        for (const uint8_t s : sum) {
            std::cout <<
                std::hex <<
                std::noshowbase <<
                std::setw(2) <<
                std::setfill('0') <<
                uint32_t(s);
        }

        std::cout << "  " << path << std::endl;
        return EXIT_SUCCESS;
    } catch (const std::exception &e) {
        std::cerr << e.what() << std::endl;
        return EXIT_FAILURE;
    }
}
