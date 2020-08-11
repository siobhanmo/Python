
def make_adder_inc(n):
    """
    >>> adder1 = make_adder_inc(5)
    >>> adder2 = make_adder_inc(6)
    >>> adder1(2) 
    7
    >>> adder1(2) # 5 + 2 + 1
    8
    >>> adder1(10) # 5 + 10 + 2
    17
    >>> [adder1(x) for x in [1, 2, 3]]
    [9, 11, 13]
    >>> adder2(5)
    11
    """
    i = []
    def adder(x):
    	nonlocal i 
    	if i == []:
    		i += [1]
    		return n + x
    	else:
    		i += [i[len(i)-1] + 1]
    		return n + x + i[len(i)-2]
    return adder

