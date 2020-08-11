"""Optional questions for Lab 1"""

# While Loops

def falling(n, k):
    """Compute the falling factorial of n to depth k.

    >>> falling(6, 3)  # 6 * 5 * 4
    120
    >>> falling(4, 0)
    1
    >>> falling(4, 3)  # 4 * 3 * 2
    24
    >>> falling(4, 1)  # 4
    4
    """
    sum = 1
    while k>0: 
        sum = sum * n
        n -= 1
        k -= 1
    return sum 
 

def double_eights(n):
    """Return true if n has two eights in a row.
    >>> double_eights(8)
    False
    >>> double_eights(88)
    True
    >>> double_eights(2882)
    True
    >>> double_eights(880088)
    True
    >>> double_eights(12345)
    False
    >>> double_eights(80808080)
    False
    """
    num = str(n)
    num = list(num)
    l = len(num)
    i = 0
    d = 0
    while i < l-1:
        if num[i] == num[i+1] and num[i] == '8':
            d += 1
            i +=1
        else :
            i += 1
    if d > 0 :
        return True
    else :
        return False



