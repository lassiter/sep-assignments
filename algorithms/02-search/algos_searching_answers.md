1. Given the alphabetically sorted collection in this checkpoint, how many iterations would it take to find the value G using linear search?

7

2. Given the alphabetically sorted collection in this checkpoint, how many iterations would it take to find the value G using binary search?

3

3. Calculate fib(10), fib(11), fib(12) by hand.
- fib(10)

10. 55 (34+21)
9. 34 (21+13)
8. 21 (13+8)
7. 13 (8+5)
6. 8 (5+3)
5. 5 (3+2)
4. 3 (2+1)
3. 2 (1+1)
2. 1
1. 1


Answer 55

- fib(11)

11. 89 (55+34)
10. 55 (34+21)
9. 34 (21+13)
8. 21 (13+8)
7. 13 (8+5)
6. 8 (5+3)
5. 5 (3+2)
4. 3 (2+1)
3. 2 (1+1)
2. 1
1. 1

Answer 89

- fib(12)

12. 144 (89+55)
11. 89 (55+34)
10. 55 (34+21)
9. 34 (21+13)
8. 21 (13+8)
7. 13 (8+5)
6. 8 (5+3)
5. 5 (3+2)
4. 3 (2+1)
3. 2 (1+1)
2. 1
1. 1


Answer 144

4. Benchmark for Fibonacci Comparison
```
fibonacci comparison
       user     system      total        real
recursive:  0.000000   0.000000   0.000000 (  0.001702)
iterative:  0.000000   0.000000   0.000000 (  0.000013)
```

5. Benchmark for Binary Search: Recursive vs Iterative
```
input search: 't' at 19
       user     system      total        real
recursive: t
  0.000000   0.000000   0.000000 (  0.000023)
iterative: t
  0.000000   0.000000   0.000000 (  0.000033)
```

7. Given an unsorted collection of a million items, which algorithm would you choose between linear search and binary search? Would you use an iterative or recursive solution? Explain your reasoning.

You wouldn't be able to run a Binary Search on an unsorted collection without sorting it first for most cases. The only case where you could use a Binary Search is on a rotated array. Linear Search would be the best choice as an iterative for most cases.

8. Given a sorted collection of a million items, which algorithm would you choose between linear search and binary search? Would you use an iterative or recursive solution? Explain your reasoning.

I would choose a recursive (prefrence) Binary Search because it would limit the scope on the million items because they can only exist in a certain part of the binary tree. 

Regarding 7 and 8, The language processor would likely just turn both an iterative and recursive solution into loops. However, on the off case that recursive wasn't an option because of an interpretor or compiler then I would choose iterative. 