/**
 * @copyright 2020 YelloSoft
 * @mainpage
 *
 * Displays magic numbers.
 */

#include <stdio.h>
#include <stdlib.h>

int main() {
    unsigned int magic[16] = {
        0x09, 0xf9, 0x11, 0x02, 0x9d, 0x74, 0xe3, 0x5b,
        0xd8, 0x41, 0x56, 0xc5, 0x63, 0x56, 0x88, 0xbc
    };

    for (int i = 0; i < 7; i++) {
        magic[15]++;

        if (i == 3) {
            printf("                 [ redacted ]\n");
            continue;
        }

        printf(
            "%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
            magic[0], magic[1], magic[2], magic[3], magic[4], magic[5], magic[6], magic[7],
            magic[8], magic[9], magic[10], magic[11], magic[12], magic[13], magic[14],
            magic[15]
        );
    }

    return EXIT_SUCCESS;
}
