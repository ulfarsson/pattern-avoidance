load("../pattern-avoidance/sub_functions.sage")

def avoids_mpat(perm, mpat):
    """
    Returns False if the mesh pattern mpat occurs in the permutation perm,
    otherwise returns True

    EXAMPLES

    sage: avoids_mpat([1,2,3], ([1,2], [(0,0)]))
    False
    """

    pat = mpat[0]
    R   = mpat[1]

    k = len(pat)
    n = len(perm)

    # If the pattern is longer than the permutation, return True
    if k > n: return True

    pat  = G(pat)
    perm = G(perm)

    for H in Subwords(perm, k):

        X = dict(G(sorted(i for (i,_) in H)))
        Y = dict(G(sorted(j for (_,j) in H)))
        if H == [ (X[i], Y[j]) for (i,j) in pat ]:
            X[0], X[k+1] = 0, n+1
            Y[0], Y[k+1] = 0, n+1
            shady = ( X[i] < x < X[i+1] and Y[j] < y < Y[j+1]
                      for (i,j) in R
                      for (x,y) in perm
                      )
            if not any(shady):
                return False
    return True