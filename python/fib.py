#!/usr/bin/env python3

"""Compute Fibonacci numbers"""

import time

def fib(n):
  """fibonacci(n)"""

  if n < 2:
    return n
  else:
    a, b = 0, 1

    m = n - 1

    i = 0

    while i < m:
      a, b = b, a + b
      i += 1

    return b

  # # recursion overhead is slow
  # def fib(n):
  # """fibonacci(n)"""
  #   if n == 0:
  #     return 0
  #   elif n == 1:
  #     return 1
  #   else:
  #     return fib(n - 1) + fib(n - 2)

if __name__ == "__main__":
  N = int(raw_input("N = "))

  print("Running")

  START_TIME = time.time()

  X = fib(N)

  END_TIME = time.time()

  print("Fib %d = %d" % (N, X))

  print("Time = %d sec" % (END_TIME - START_TIME))
