'''
GCD algorithm
'''


def gcd(a, b):
    while b:
        if a > b:
            a = a - b
        else:
            b = b - a
    return a


'''
Rectangles on a rubik's cube
'''


def rubiks(n):
    def count_a_face(n):
        return (n**2 * (n + 1)**2) // 4

    return 6 * count_a_face(n)


'''
Guessing a number
'''


def guess_unlimited(n, is_this_it):
    # The code here is only for illustrating how is_this_it() may be used
    for i in xrange(1, n + 1):
        if is_this_it(i):
            return i
    return -1


'''
Guessing a number where you can only make two guesses that are larger
'''


def guess_limited(n, is_this_smaller):
    # i = steps = (int)(n**0.5) not optimal
    # i + (i - 1) + ... + 1 >= n
    # solve for i: (i + 1) * i / 2 >= n
    steps = i = (int)((-1 + (1 + 8 * n)**0.5) / 2 + 1)
    start = 1

    # print "\n\n\nsteps = "+str(steps)
    while i <= n:
        # print "checking floor " + str(i)
        if not is_this_smaller(i):
            # print str(i) + " is not smaller than target, xrange = " + str(
            #     start) + " ~ " + str(i)
            break
        start = i + 1
        steps -= 1
        i += steps

    for x in xrange(start, i):
        # print "level by level at floor " + str(x)
        if not is_this_smaller(x):
            return x
    return i


'''
Guessing a number, bonus problem
'''


def guess_limited_plus(n, is_this_smaller):
    def get_threshold(lo, hi):
        # lg(1 / p) == 2 lg((p-1) / p), p = (3 + sqrt(5)) / 2
        mid = int(lo + (hi - lo) // 2.618033988749895)
        return mid

    lo, hi = 1, n

    while lo < hi:
        mid = get_threshold(lo, hi)
        # print "at floor " + str(mid) + ", low = " + str(
        #     lo) + ", high = " + str(hi)
        if is_this_smaller(mid):
            lo = mid + 1
        else:
            hi = mid

    return lo
