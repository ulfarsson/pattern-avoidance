'''
TODO: Write a faster to_standard
'''
from sage.combinat.permutation import to_standard

def G(w):
    """
    The graph/diagram of the permutation w as a list of points
    """
    return [ (x+1,y) for (x,y) in enumerate(w) ]

def plot_perm(w):

    n = len(w)
    r = 2*n+1

    arr = [[' ' for i in range(r)] for j in range(r)]

    for i in range(r):
        for j in range(r):

            a = i % 2 == 1
            b = j % 2 == 1

            if a and b:
                arr[i][j] = '+'
            elif a:
                arr[i][j] = '-'
            elif b:
                arr[i][j] = '|'

    for i in range(n):
        arr[r-2*w[i]][2*i+1] = 'o'

    return arr

def show_perm(w):

    arr = plot_perm(w)
    out = '\n'.join( ''.join(row) for row in arr )

    return out

def plot_mpat(mpat):

    p = mpat[0]
    R = mpat[1]

    r = 2*len(p)+1

    arr = plot_perm(p)

    for b in R:
        arr[r-2*b[1]-1][2*b[0]] = 'X'

    return arr

def show_mpat(mpat):

    arr = plot_mpat(mpat)
    out = '\n'.join( ''.join(row) for row in arr )

    return out