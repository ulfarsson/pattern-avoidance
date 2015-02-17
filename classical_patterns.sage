'''
For comparison we include the built-in function from Sage
'''

def avoids_clpatt(perm, patt):
	return Permutation(perm).avoids(patt)