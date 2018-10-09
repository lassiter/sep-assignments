1. Describe an analogy for relating an algorithm that has efficiency O(1) and another algorithm that has O(2n). An example would be:

The ideal job search is O(1), you just have wait a constant and unchanging ammount of time to find a job. You could apply for 1 job, or 1000 jobs. It'll take the same ammount of time to find a job. 

O(2^n), is a constant time times two to the factor of n. So, initally, they would be about the same speed but by the time you got to your 5th or 6th job application it would be super complex.

O(1) is like applying for the same job in the same industry in the same region. This makes your resume fairly reuseable with no edits. If it was O(n), it would be with a few edits.

O(2^n) is like applying for the same job in a diffrent industry somtimes and sometimes in the diffrent region. This makes it where you might need to heavily edit your resume for each job.

2. In plain English, what is the best case scenario for binary search?

The best case is landing on the item you're searching for during the first try which is O(1).

3. In plain English, what is the worst-case scenario for binary search?

The worst case is having to search for an item O(log n). You would have to search max depth of the tree to find the item. The example below, if you were looking for 27. It would take 4 iterations based on the graph design below.

i.e. [1, 9, 10, 25, 26, 27]

        1           1
      /   \
     9    10        2
          / \
        25   26     3
            /
          27        4


4. In plain English, what is the bounded-case scenario for binary search?

The bounded-case for binary search is also O(log n) like the worst case because soon as there is not an inital best case match O(1) on the first try then it becomes O(log n).


5. Create a graph using loglinear_intro.csv.
Please see the graph.pdf file.

6. What is the limit of the function above as n approaches infinity?

+Infinity

7. What is the Big-O of an algorithm that has the data points above?

O(2^n)

8. Write a Ruby method that takes a number n. This method must print the worst-case number of iterations for linear search to find an item in collections of size one to n. Use it to generate a table of worst-case iterations of collections up to size 10.

```ruby
  def worst_case_of(n)
    return 2**n
  end
```
9. Create a graph from the output using Google Sheets or other graphing software. Analyze the graph and denote its Big-O somewhere on the graph.

Please see the graph.pdf file.

10. What is the Big-O of binary search?
O(1) being the upper bound

11. What is the Big-Ω of binary search?
O(log n) being the lower bound

12. What is the Big-Ө of binary search?
O(log n) being the mix
