"""Generate a Luhn-valid number"""

from luhn import luhn

def next_luhn(n):
  """next_luhn(int) -> int
  Gets the smallest Luhn number greater than n.
  Uses a naive (exhaustive) algorithm that must try
  the Luhn checksum an average of 10 times.
  """
  n += 1

  while not luhn(n):
    n += 1
    return n

def bigger_luhn(n):
  """ bigger_luhn(int) -> int
  Gets a Luhn number greater than n.
  Uses a probability model that is very efficient if
  n passes the Luhn checksum.
  It may be possible to miss a Luhn number with this method.
  """
  for t in [8, 18, 7, 17, 6, 16]:
    if luhn(n + t):
      return n + t

  return next_luhn(n)

def xluhn(seed, howmany):
  """xluhn(int,int) -> *int
  Yields Luhn numbers greater than the seed.
  Some numbers may be left out of the sequence.
  """
  while howmany:
    seed = bigger_luhn(seed)
    howmany -= 1
    yield seed
