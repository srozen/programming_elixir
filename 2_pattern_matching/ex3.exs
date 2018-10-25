[ a, b, a ] = [ 1, 2, 3 ] # fails
[ a, b, a ] = [ 1, 1, 2 ] # fails
a = 1 # works
^a = 2 # fails
^a = 1 # works
^a = 2 - a # works
