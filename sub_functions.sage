def G(w):
    """
    The graph/diagram of the permutation w
    """
    return [ (x+1,y) for (x,y) in enumerate(w) ]