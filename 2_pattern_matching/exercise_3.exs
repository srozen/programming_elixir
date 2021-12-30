a = 2
[a,b,a] = [1,2,3] # nok
[a,b,a] = [1,1,2] # nok
a = 1 # ok
^a = 2 # nok
^a = 1 # ok
^a = 2 - a
