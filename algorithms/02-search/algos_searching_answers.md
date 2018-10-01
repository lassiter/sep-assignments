1. Given the alphabetically sorted collection in this checkpoint, how many iterations would it take to find the value G using linear search?

7

2. Given the alphabetically sorted collection in this checkpoint, how many iterations would it take to find the value G using binary search?

3

3. Calculate fib(10), fib(11), fib(12) by hand.
- fib(10)
  10-1, 10-2  17
  9-1, 8-2    12
  8-1, 6-2    11
  7-1, 4-2    8
  6-1, 2-2    5
  5-1, 0      4
  4-1, 0      3
  3-1, 0      2
  2-1, 0      1
  1, 0        1

Answer 64

- fib(11)

  11-1, 11-2  19
  10-1, 10-2  17
  9-1, 8-2    12
  8-1, 6-2    11
  7-1, 4-2    8
  6-1, 2-2    5
  5-1, 0      4
  4-1, 0      3
  3-1, 0      2
  2-1, 0      1
  1, 0        1

Answer 83

- fib(12)

  12-1, 12-2  21
  11-1, 11-2  19
  10-1, 10-2  17
  9-1, 8-2    12
  8-1, 6-2    11
  7-1, 4-2    8
  6-1, 2-2    5
  5-1, 0      4
  4-1, 0      3
  3-1, 0      2
  2-1, 0      1
  1, 0        1

Answer 104

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