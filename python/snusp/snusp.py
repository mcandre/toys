#!/usr/bin/env python

"""A SNUSP interpreter"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "27 Feb 2006 - 12 Mar 2006"
__copyright__ = "Copyright 2006 Andrew Pennebaker"
__version__ = "0.2" # seems to work

import getopt
import sys

class SNUSPInterpreter:
  """SNUSP interpreter"""

  START = "$"
  SUBPROCESS = "@"
  RETURN = "#"

  NEXT = ">"
  PREVIOUS = "<"
  ADD = "+"
  SUBTRACT = "-"
  WRITE = "."
  READ = ","

  SLASH = "/"
  BACKSLASH = "\\"
  JUMP = "!"
  QUERY = "?"

  NOP1 = " = "
  NOP2 = "|"
  NOP3 = "*"

  RIGHT = "R"
  LEFT = "L"
  DOWN = "D"
  UP = "U"

  tape = [0] # dynamic length
  address = 0

  steps = 0

  board = ["$#"]
  stack = [(0, 0, "R")]

  def __init__(self, debug = False):
    self.debug = debug

  def print_board(self):
    """Debug"""

    for row in range(len(self.board)):
      for column in range(len(self.board[row])):
        for plate in range(len(self.stack)):
          row2, column2, direction = self.stack[plate]

          if row == row2 and column == column2:
            sys.stdout.write("%d" % (len(self.stack) - plate))
            break
          else:
            sys.stdout.write(self.board[row][column])
            sys.stdout.write("\n")

  def move(self):
    """Move head"""

    row, column, direction = self.stack[0]

    if direction == self.RIGHT:
      self.stack[0] = (row, column + 1, direction)
    elif direction == self.LEFT:
      self.stack[0] = (row, column - 1, direction)
    elif direction == self.DOWN:
      self.stack[0] = (row + 1, column, direction)
    elif direction == self.UP:
      self.stack[0] = (row - 1, column, direction)

  def rotate(self, operator):
    """Rotate head"""

    row, column, direction = self.stack[0]

    if operator == self.SLASH:
      if direction == self.RIGHT:
        direction = self.UP
      elif direction == self.LEFT:
        direction = self.DOWN
      elif direction == self.DOWN:
        direction = self.LEFT
      elif direction == self.UP:
        direction = self.RIGHT
      elif operator == self.BACKSLASH:
        if direction == self.RIGHT:
          direction = self.DOWN
        elif direction == self.LEFT:
          direction = self.UP
        elif direction == self.DOWN:
          direction = self.RIGHT
        elif direction == self.UP:
          direction = self.LEFT

    self.stack[0] = (row, column, direction)

  def move_back(self):
    """Reverse head"""

    row, column, direction = self.stack[0]

    if direction == self.RIGHT:
      self.stack[0] = (row, column - 1, direction)
    elif direction == self.LEFT:
      self.stack[0] = (row, column + 1, direction)
    elif direction == self.DOWN:
      self.stack[0] = (row - 1, column, direction)
    elif direction == self.UP:
      self.stack[0] = (row + 1, column, direction)

  def step(self):
    """Tick"""

    self.steps += 1

    if self.debug:
      print("Step: %d" % (self.steps))
      print("Board:")
      self.print_board()
      print("Stack:")
      print(self.stack)
      print("Tape: %s" % (" ".join(["%d" % (e) for e in self.tape])))

    row, column, direction = self.stack[0]

    cmd = ""

    try:
      cmd = self.board[row][column]
    except IndexError:
      raise Exception("Board index out of range")

    if cmd == self.START:
      self.move()
    elif cmd == self.SUBPROCESS:
      if self.tape[self.address] == 0:
        # push command after skipped command
        self.move()
        self.move()
        plate = self.stack[0]
        self.stack.insert(0, plate)

        # backwards to unskipped command
        self.move_back()
      else:
        self.move()
    elif cmd == self.ADD:
      self.tape[self.address] += 1
      self.move()
    elif cmd == self.SUBTRACT:
      self.tape[self.address] -= 1
      self.move()
    elif cmd == self.NEXT:
      self.address += 1

      if self.address >= len(self.tape):
        self.tape.append(0)

      self.move()
    elif cmd == self.PREVIOUS:
      self.address -= 1

      if self.address < 0:
        raise Exception("Tape index out of range")

      self.move()
    elif cmd == self.WRITE:
      sys.stdout.write(chr(self.tape[self.address]))
      self.move()
    elif cmd == self.READ:
      try:
        self.tape[self.address] = ord(sys.stdin.read(1))
      except:
        self.tape[self.address] = -1

      self.move()
    elif cmd == self.SLASH or cmd == self.BACKSLASH:
      self.rotate(cmd)
      self.move()
    elif cmd == self.JUMP:
      self.move()
      self.move()
    elif cmd == self.QUERY:
      if self.tape[self.address] == 0:
        self.move()
        self.move()
      else:
        self.move()
    elif cmd == self.RETURN:
      self.stack.pop(0)
    # white-space
    else:
      self.move()

  def find_start(self):
    """Find start"""

    row = 0
    while row < len(self.board):
      column = 0
      while column < len(self.board[row]):
        if self.board[row][column] == self.START:
          return (row, column)
        else:
          column += 1
          row += 1

    return (0, 0) # start not found

  def run(self):
    """Run SNUSP code"""

    while len(self.stack) > 0:
      self.step()

  def compile(self, text):
    """Prepare SNUSP code"""

    lines = text.split("\n")

    for i in range(len(lines)):
      lines[i] = lines[i]

    # find longest line
    longest = 0
    for i in range(len(lines)):
      if len(lines[i]) > len(lines[longest]):
        longest = i

    # insert spaces in shorter lines
    for i in range(len(lines)):
      lines[i] += " " * (len(lines[longest]) - len(lines[i]))

    self.board = []
    for line in lines:
      self.board.append(line)

    startRow, start_column = self.find_start()

    self.stack = [(startRow, start_column, self.RIGHT)]

def usage():
  """Print usage message"""

  print("Usage: %s [options] <sourcefile>" % (sys.argv[0]))
  print("\n-d|--debug prints board for every move")
  print("-n|--nowait step without pauses")
  print("-h|--help (usage)")

  sys.exit()

def main():
  """CLI"""

  system_args = sys.argv[1:] # ignore program name

  debug = False
  wait = True

  optlist = []
  args = []

  try:
    optlist, args = getopt.getopt(
      system_args,
      "dnh",
      ["debug", "nowait", "help"]
    )
  except getopt.GetoptError:
    usage()

  if len(args) < 1:
    usage()

  for option, value in optlist:
    if option == "-h" or option == "--help":
      usage()

    elif option == "-d" or option == "--debug":
      debug = True
    elif option == "-n" or option == "--nowait":
      wait = False

  src = args[0]

  srcfile = open(src, "r")
  code = "".join(srcfile.readlines())
  srcfile.close()

  si = SNUSPInterpreter(debug)
  si.compile(code)

  if debug:
    while len(si.stack) > 0:
      si.step()
      if wait:
        raw_input()
      else:
        si.run()

if __name__ == "__main__":
  try:
    main()
  except KeyboardInterrupt:
    pass
