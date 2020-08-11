""" Lab 04 Optional Questions """

from lab04 import *


this_file = __file__

def hailstone(n):
    """Print out the hailstone sequence starting at n, and return the
    number of elements in the sequence.

    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    >>> # Do not use while/for loops!
    >>> from construct_check import check
    >>> check(this_file, 'hailstone',
    ...       ['While', 'For'])
    True
    """
    def helper(m, num):
        if num == 1:
            print(num)
            return m
        elif num%2 == 0:
            print(num)
            m = helper(m+1,round(num/2))
        else: 
            print(num)
            m = helper(m+1,round(num*3 +1))
        return m
    
    elements = helper(1, n)
    return elements

