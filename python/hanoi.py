#!/usr/bin/env python3

"""Solve Tower of Hanoi"""

import time

START = 0
AUX = 1
END = 2

def hanoi(n, start, aux, end):
  """Recursive solution"""

  if n == 1:
    return (start, end)

  return (
    hanoi(n - 1, start, aux, end) +
    (start, aux) +
    hanoi(n - 1, aux, end, start)
  )

def main():
  """Run solution"""

  n = int(input("N = "))

  print("Running")

  start_time = time.time()

  hanoi(n, START, AUX, END)

  end_time = time.time()

  print("Time = %d sec" % (end_time - start_time))

  # print("Steps = %s" % str(steps))

if __name__ == "__main__":
  try:
    main()
  except KeyboardInterrupt:
    pass
