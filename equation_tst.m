N = 16;
k = 0:log2(N)
samples = ceil((N./2.^(k+1)))
operations = 2.^k - 1