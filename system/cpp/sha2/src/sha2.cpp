#include <cstdint>
#include <cstdlib>
#include <cstring>




#include <iostream>

#include <stdexcept>
#include <string>

using std::literals::string_literals::operator""s;

#include "sha2/sha2.hpp"

namespace sha2 {
void SHA2::Pad() {
    content_buf[count_bytes] = 0x80;
    count_bytes++;

    while (count_bytes % 64 != 0) {
        count_bytes++;
    }


    std::cerr << "total_count_bytes: " << total_count_bytes << std::endl;

    const auto total_count_bits = 8 * total_count_bytes;

    std::cerr << "total_count_bits: " << total_count_bits << std::endl;

    for (int i = 7; i >= 0; i--) {
        content_buf[count_bytes-i-1] = uint8_t(total_count_bits >> (8ULL * uint64_t(i)));
    }
}

void SHA2::Mutate() {
    (void) std::memset(w, 0, sizeof(w));


    std::cerr << "count_bytes: " << count_bytes << std::endl;

    (void) std::memcpy(w, content_buf, size_t(count_bytes));

    uint32_t s0 = 0,
             s1 = 0;

    for (auto i = 16UL; i < 64UL; i++) {
        s0 = __builtin_rotateright32(w[i-15], 7UL) ^ __builtin_rotateright32(w[i-15], 18UL) ^ (w[i-15] >> 3UL);
        s1 = __builtin_rotateright32(w[i-2], 17UL) ^ __builtin_rotateright32(w[i-2], 19UL) ^ (w[i-2] >> 10UL);
        w[i] = w[i-16] + s0 + w[i-7] + s1;
    }

    uint32_t ch = 0,
             maj = 0,
             S0 = 0,
             S1 = 0,
             temp1 = 0,
             temp2 = 0,
             a = hash[0],
             b = hash[1],
             c = hash[2],
             d = hash[3],
             e = hash[4],
             f = hash[5],
             g = hash[6],
             h = hash[7];

    for (auto i = 0UL; i < 64UL; i++) {
        S1 = __builtin_rotateright32(e, 6UL) ^ __builtin_rotateright32(e, 11UL) ^ __builtin_rotateright32(e, 25UL);
        ch = (e & f) ^ ((~e) & g);
        temp1 = h + S1 + ch + k[i] + w[i];
        S0 = __builtin_rotateright32(a, 2UL) ^ __builtin_rotateright32(a, 13UL) ^ __builtin_rotateright32(a, 22UL);
        maj = (a & b) ^ (a & c) ^ (b & c);
        temp2 = S0 + maj;
        h = g;
        g = f;
        f = e;
        e = d + temp1;
        d = c;
        c = b;
        b = a;
        a = temp1 + temp2;
        hash[0] += a;
        hash[1] += b;
        hash[2] += c;
        hash[3] += d;
        hash[4] += e;
        hash[5] += f;
        hash[6] += g;
        hash[7] += h;
    }
}

void SHA2::Encrypt(const std::string &path) {
    hash[0] = 0x6a09e667;
    hash[1] = 0xbb67ae85;
    hash[2] = 0x3c6ef372;
    hash[3] = 0xa54ff53a;
    hash[4] = 0x510e527f;
    hash[5] = 0x9b05688c;
    hash[6] = 0x1f83d9ab;
    hash[7] = 0x5be0cd19;

    FILE *f = fopen(path.c_str(), "rbe");

    if (f == nullptr) {
        throw std::runtime_error("error opening file: "s + path);
    }

    while (true) {
        (void) std::memset(content_buf, 0, sizeof(content_buf));
        count_bytes = fread(content_buf, size_t(1), size_t(64), f);
        total_count_bytes += count_bytes;

        if (ferror(f)) {
            throw std::runtime_error("error reading file: "s + path);
        }

        if (feof(f)) {
            break;
        }

        Mutate();
    }

    Pad();
    Mutate();

    if (fclose(f) == EOF) {
        throw std::runtime_error("error closing file: "s + path);
    }
}
}
