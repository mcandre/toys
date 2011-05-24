def luhn(n):
    """luhnsum(int)->bool
    Mod 10 checksum by Hans Peter Luhn (1896�1964)
    """
    sum=0
    while n:
        r=n%100
        n//=100
        z=r%10
        r=r//10*2
        sum+=r//10+r%10+z
    return 0==sum%10
