"""Andrew's Input/Output module"""

__author__ = "Andrew Pennebaker (andrew.pennebaker@gmail.com)"
__date__ = "21 Dec 2005 - 27 May 2006"
__copyright__ = "Copyright 2005 Andrew Pennebaker"
__version__ = "0.2"

def get_byte_array(s):
  """Convert string to byte list"""

  return [ord(e) for e in s]

def read_all(f):
  """Read all bytes from file into an array"""

  byte_array = []
  line = f.readline()
  while line != "":
    for e in line:
      byte_array.append(ord(e))
    line = f.readline()

  return byte_array

def chomp(text):
  """Strip trailing line ending characters"""

  if text == "" or text == "\n":
    return ""
  elif text[-1] == "\n":
    return text[:-1]
  else:
    return text

def get_size(file):
  """Size of file in bytes"""

  try:
    f = open(file, "rb")
  except Exception, e:
    raise e

  b = 0

  c = f.read(1)

  while c != "":
    b += 1
    c = f.read(1)
  f.close()

  return b
