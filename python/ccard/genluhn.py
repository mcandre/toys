def nextLuhn(n):
    """nextLuhn(int) -> int
    Gets the smallest Luhn number greater than n.
    Uses a naive (exhaustive) algorithm that must try
    the Luhn checksum an average of 10 times.
    """
    n+=1
    while not luhn(n):
        n+=1
    return n

def biggerLuhn(n):
    """ biggerLuhn(int) -> int
    Gets a Luhn number greater than n.
    Uses a probability model that is very efficient if
    n passes the Luhn checksum. 
    It may be possible to miss a Luhn number with this method.
    """
    for t in [8, 18, 7, 17, 6, 16]:
        if luhn(n+t):
            return n+t
    return nextLuhn(n)
    
def xluhn(seed,howmany):
    """xluhn(int,int) ->*int
    Yields Luhn numbers greater than the seed.
    Some numbers may be left out of the sequence.
    """
    while howmany:
        seed=biggerLuhn(seed)
        howmany-=1
        yield seed
