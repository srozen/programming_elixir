a = [1,2,3] # works
a = 4 # works
4 = a # works
[a, b] = [ 1, 2, 3 ] # fails
a = [ [ 1, 2, 3 ] ] # works
[a] = [ [ 1, 2, 3 ] ] # works
[[a]] = [ [ 1, 2, 3 ] ] # fails
