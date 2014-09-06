"""StarCraft key generator"""

import time
import random

from Keygen import Keygen

class SCKeygen(Keygen):
  """SC key generator"""

  STATIC = [
    3333333333333,
    1234567891234,
    1234567890002,
    0000000000003,
    1998000001997
  ]

  # x = 1r35-5r0r1-30rr
  def _generate(self):
    """Generate SC key"""

    random.seed(time.time())
    r = lambda: random.randint(0, 9)

    x = (
      r() +
      r() * 10 +
      3 * 10 ** 3 +
      10 ** 4 +
      r() * 10 ** 5 +
      r() * 10 ** 7 +
      5 * 10 ** 8 +
      5 * 10 ** 9 +
      3 * 10 ** 10 +
      r() * 10 ** 11 +
      1 * 10 ** 12
    )

    return x

  def format(self, num):
    """Format SC key"""

    c = num % 10000
    num /= 10000

    b = num % 100000
    num /= 100000

    a = num

    return "%04d-%05d-%04d" % (a, b, c)

  def unformat(self, s):
    """Parse SC key"""

    if "-" in s:
      s = "".join(s.split("-"))

    a, b, c = int(s[:4]), int(s[4:9]), int(s[9:])

    return (a * 10 ** 9) + (b * 10 ** 4) + c

  def _verify(self, num):
    small_enough = num <= 1935590913099
    large_enough = num >= 1035500013000

    if small_enough and large_enough:
      try:
        num /= 100
        a = num % 1000 == 130
        num /= 1000

        num /= 10

        b = num % 10 == 0
        num /= 10

        num /= 10
        c = num % 1000 == 355
        num /= 1000

        # # small_enough and large_enough prove d will equal 1
        # num /= 10
        # d = num == 1

        return a and b and c # and d
      except ZeroDivisionError:
        return False

def main():
  """Generate SC key"""

  SCKeygen().main()

if __name__ == "__main__":
  main()
