"""Luhn verifier"""


def card_luhn_checksum_is_valid(card_number):
    """ checks to make sure that the card passes a luhn mod-10 checksum """

    s = 0
    num_digits = len(card_number)
    oddeven = num_digits & 1

    for count in range(0, num_digits):
        digit = int(card_number[count])

        if not ((count & 1) ^ oddeven):
            digit = digit * 2

            if digit > 9:
                digit = digit - 9

                s += digit

    return (s % 10) == 0
