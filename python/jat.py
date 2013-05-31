#!/usr/bin/env python3

"""ASCII art"""

# JAT: The Joy of ASCII Art
# http://codegolf.com/bob-ross-the-joy-of-ascii-art

def chomp(s):
  """Strip trailing line endings"""

  if len(s) > 0 and s[-1] == "\n":
    return s[:-2]
  else:
    return s

def get_input():
  """Read input from stdin"""

  while True:
    try:
      line = raw_input()

      if len(line) == 0:
        break
      else:
        yield chomp(line)
    except EOFError:
      break

def mark(rows, x, y, c):
  """Mark a region"""

  space = " "

  rows += [] * (y + 1 - len(rows))

  rows[y] += space * (x + 1 - len(rows[y]))

  rows[y][x] = c

def print_pic(rows):
  """Print ASCII art"""

  for row in rows:
    print("".join(row))

def main():
  """CLI"""

  rows = []

  for line in get_input():
    parts = line.split(" ")

    x, y, c = int(parts[0]), int(parts[1]), chr(int(parts[2]))

    mark(rows, x, y, c)

  print_pic(rows)

if __name__ == "__main__":
  try:
    main()
  except KeyboardInterrupt:
    pass
