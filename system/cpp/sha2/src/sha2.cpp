#include <cstdint>
#include <cstdlib>
#include <cstring>




#include <iostream>

#include <stdexcept>
#include <string>

using std::literals::string_literals::operator""s;

#include "sha2/sha2.hpp"

namespace sha2 {
uint64_t htonll(uint64_t x) {
    return (htonl(1UL) == 1UL) ? x : ((uint64_t(htonl(x >> 32UL)) << 32UL) | uint64_t(htonl(uint32_t(x))));
}

void SHA2::Pad() {
    content_buf[count] = 0x80;
    count++;

    while (count % 64 != 0) {
        count++;
    }




    std::cerr << "len_bits: " << len_bits << std::endl;

    content_buf[count-2] = htonll(len_bits);
}

void SHA2::Mutate() {
    Pad();

    (void) std::memset(w, 0, sizeof(w));


    std::cerr << "count: " << count << std::endl;

    (void) std::memcpy(w, content_buf, size_t(count));

    uint32_t s0 = 0,
             s1 = 0;

    for (auto i = 16UL; i < 64UL; i++) {
        s0 = __builtin_rotateright32(w[i-15], 7UL) ^ __builtin_rotateright32(w[i-15], 18UL) ^ (w[i-15] >> 3UL);
        s1 = __builtin_rotateright32(w[i-2], 17UL) ^ __builtin_rotateright32(w[i-2], 19UL) ^ (w[i-2] >> 10UL);
        w[i] = w[i-16] + s0 + w[i-7] + s1;
    }

    uint32_t ch = 0,
             maj = 0,
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
        s1 = __builtin_rotateright32(e, 6UL) ^ __builtin_rotateright32(e, 11UL) ^ __builtin_rotateright32(e, 25UL);
        ch = (e & f) ^ ((~e) & g);
        temp1 = h + s1 + ch + k[i] + w[i];
        s0 = __builtin_rotateright32(a, 2UL) ^ __builtin_rotateright32(a, 13UL) ^ __builtin_rotateright32(a, 22UL);
        maj = (a & b) ^ (a & c) ^ (b & c);
        temp2 = s0 + maj;
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
        count = fread(content_buf, size_t(1), size_t(64), f);
        len_bits = 8 * count;

        if (ferror(f)) {
            throw std::runtime_error("error reading file: "s + path);
        }

        if (count == 0) {
            break;
        }

        Mutate();

        if (feof(f)) {
            break;
        }
    }

    if (fclose(f) == EOF) {
        throw std::runtime_error("error closing file: "s + path);
    }
}
}
