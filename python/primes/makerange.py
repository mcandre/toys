'''Creates ranges of logical port numbers in the form:

-25,30,400-500,70-90,8000-'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '12 Feb 2006'
__copyright__ = 'Copyright 2006 Andrew Pennebaker'
__version__ = '0.1'


def makerange(s, min=0, max=65536):
    '''Forms:\t-80 (min to 80)
\t60000- (60000 to max)
\t40, 50, 60 (40 50 and 60)'''

    sets = s.split(',')

    r = []

    for s in sets:
        # form: -300
        if s[0] == '-':
            temp = range(min, int(s[1:]) + 1)
            r += temp
            # form: 20000-
        elif s[-1] == '-':
            temp = range(int(s[:-1]), max + 1)
            r += temp
            # form: 200-300
        elif '-' in s:
            low, high = s.split('-')
            temp = range(int(low), int(high) + 1)  # inclusive
            r += temp
            # form: 80
        else:
            temp = int(s)
            r.append(temp)

    for e in r:
        if e < min or e > max:
            raise makerange.__doc__

    return r
