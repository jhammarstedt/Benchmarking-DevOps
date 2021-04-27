import pytest

# Here are some example functions to run, can of course be replaced by your own to test things out

# Task: Create a list of N numbers in string format, then add all of these to one long string 
def turtle(n=1000000):
    """
    Regular for loops
    This is an example of a slow running code, we start of by running a regular for loop, 
    which is ok but not best practice in python for doing these simple tasks. 

    To then create the string we run another for loop, which is inefficient since python has
    several built in functions to handle this. 
    """
    x = [] 
    for i in range(n,0,-1):
        x.append(str(i))
    
    s= ""
    for i in x:
        s+= i

def cheetah(n=1000000):
    """
    Faster with list comprehenssion and join
    Here we utilize pythons list comprehenssion to perform the same task but faster.

    "".join() is a python function that operates on lists and directly inserts all elements.
    The separator will be whatever we put in the "" (in this case none), but you could separate them
    by space " ".join(x) or comma ",".join(x)
    """

    x = [str(i) for i in range(n,0,-1)]
    s = "".join(x)

# This is where pytest gets called   
def test_turtle(benchmark):
    result = benchmark(turtle)

def test_cheetah(benchmark):
    result = benchmark(cheetah)

