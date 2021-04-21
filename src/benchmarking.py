import pytest
import time


def test_case1(n=1000000):
    """Regular for loop"""
    x = [] 
    for i in range(n,0,-1):
        x.append(str(i))
    
    s= ""
    for i in x:
        s+= i


def test_case2(n=1000000):
    """Faster with list comprehenssion and join"""
    x = [str(i) for i in range(n,0,-1)]
    s = "".join(x)
    

def run_test(benchmark):
    benchmark(test_case2)
