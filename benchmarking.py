import pytest
def test_loop(n=200):
    x = []
    for i in range(n,0,-1):
        x.append(i)
        x.sort()

def test_case(benchmark):
    benchmark(test_loop,args)
