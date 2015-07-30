"""Lists prime factors of composite"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "26 Nov 2005"
__copyright__ = "Copyright 2005 Andrew Pennebaker"
__version__ = "0.1"


def factor(x):
    """Find a factor of x"""

    if x == 1:
        return 1L

    i = 2L
    while (x % i) != 0 and i < x ** 0.5:
        i += 1

    if x % i != 0:
        return x

    return i


def get_all_factors(x):
    """Find all factors of x"""

    factors = [1, factor(x)]

    while factors[-1] != x:
        x /= factors[-1]
        factors.append(factor(x))

    return factors
