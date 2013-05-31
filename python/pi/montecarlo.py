#!/usr/bin/env python

"""Monte Carlo demo"""

import sys
from random import random # Mersienne Twister as the core generator

def main():
  """CLI"""

  points = int(sys.argv[1]) # Number of MC attempts

  in_square = 0

  for point in range(points):
    x = 2 * (random() - 0.5)
    y = 2 * (random() - 0.5)
    d = x * x + y * y

    if d <= 1:
      in_square = in_square + 1

  pi = 4.0 * in_square / points

  print("Approximation to Pi after", points, "points: ", pi)

if __name__ == "__main__":
  main()
