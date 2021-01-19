"""Luhn checksum"""


def luhn(n):
    """
    luhnsum(int) -> bool
    Mod 10 checksum by Hans Peter Luhn (1896-1964)
    """

    s = 0

    while n:
        r = n % 100
        n /= 100
        z = r % 10
        r /= 10 * 2
        s += r / 10 + r % 10 + z

    return s % 10 == 0
