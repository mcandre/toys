#include <arpa/inet.h>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <stdexcept>
#include <string>

using std::literals::string_literals::operator""s;

#include "sha2/sha2.hpp"

namespace sha2 {
Endian HostEndianness() {
    if (htonl(1UL) != 1UL) {
        return Endian::LITTLE;
    }

    return Endian::BIG;
}

uint16_t EnsureEndianness16(uint16_t x, Endian target) {
    if (HostEndianness() == target) {
        return x;
    }

    return htons(x);
}

uint32_t EnsureEndianness32(uint32_t x, Endian target) {
    if (HostEndianness() == target) {
        return x;
    }

    return htonl(x);
}

uint64_t EnsureEndianness64(uint64_t x, Endian target) {
    if (HostEndianness() == target) {
        return x;
    }

    return __builtin_bswap64(x);
}

uint32_t sigma0(uint32_t x) {
    return RotR32(x, 7UL) ^ RotR32(x, 18UL) ^ (x >> 3UL);
}

uint32_t sigma1(uint32_t x) {
    return RotR32(x, 17UL) ^ RotR32(x, 19UL) ^ (x >> 10UL);
}

uint32_t Sigma0(uint32_t x) {
    return RotR32(x, 2UL) ^ RotR32(x, 13UL) ^ RotR32(x, 22UL);
}

uint32_t Sigma1(uint32_t x) {
    return RotR32(x, 6UL) ^ RotR32(x, 11UL) ^ RotR32(x, 25UL);
}

uint32_t Ch(uint32_t x, uint32_t y, uint32_t z) {
    return (x & y) ^ (~(x) & z);
}

uint32_t Maj(uint32_t x, uint32_t y, uint32_t z) {
    return (x & y) ^ (x & z) ^ (y & z);
}

uint32_t RotR32(uint32_t x, uint32_t places) {
    return (x >> places) | (x << (32UL - places));
}

void SHA2::Pad() {
    content_buf[count_bytes++] = 0x80;
    count_bytes = (count_bytes > size_t(112)) ? size_t(128) : size_t(64);
    const auto total_count_bits = EnsureEndianness64(8ULL * total_count_bytes, Endian::BIG);
    (void) memcpy(content_buf + count_bytes - 8, &total_count_bits, 8);
}

void SHA2::Mutate() {
    (void) std::memset(w, 0, sizeof(w));
    (void) std::memcpy(w, content_buf + offset, 64);

    for (auto i = size_t(16); i < size_t(64); i++) {
        w[i] = EnsureEndianness32(
                (
                    sigma1(EnsureEndianness32(w[i-2], Endian::BIG)) +
                    EnsureEndianness32(w[i-7], Endian::BIG) +
                    sigma0(EnsureEndianness32(w[i-15], Endian::BIG)) +
                    EnsureEndianness32(w[i-16], Endian::BIG)
                ),
                Endian::BIG
        );
    }

    uint32_t temp1 = 0,
             temp2 = 0,
             a = hash[0],
             b = hash[1],
             c = hash[2],
             d = hash[3],
             e = hash[4],
             f = hash[5],
             g = hash[6],
             h = hash[7];

    for (auto i = size_t(0); i < size_t(64); i++) {
        temp1 = h + Sigma1(e) + Ch(e, f, g) + k[i] + EnsureEndianness32(w[i], Endian::BIG);
        temp2 = Sigma0(a) + Maj(a, b, c);
        h = g;
        g = f;
        f = e;
        e = d + temp1;
        d = c;
        c = b;
        b = a;
        a = temp1 + temp2;
    }

    hash[0] += a;
    hash[1] += b;
    hash[2] += c;
    hash[3] += d;
    hash[4] += e;
    hash[5] += f;
    hash[6] += g;
    hash[7] += h;
}

void SHA2::Encrypt(const std::string &path) {
    total_count_bytes = 0;
    count_bytes = 0;
    offset = 0;

    hash[0] = 0x6a09e667UL;
    hash[1] = 0xbb67ae85UL;
    hash[2] = 0x3c6ef372UL;
    hash[3] = 0xa54ff53aUL;
    hash[4] = 0x510e527fUL;
    hash[5] = 0x9b05688cUL;
    hash[6] = 0x1f83d9abUL;
    hash[7] = 0x5be0cd19UL;

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

    if (count_bytes > size_t(64)) {
        offset = size_t(64);
        Mutate();
    }

    if (fclose(f) == EOF) {
        throw std::runtime_error("error closing file: "s + path);
    }
}
}
