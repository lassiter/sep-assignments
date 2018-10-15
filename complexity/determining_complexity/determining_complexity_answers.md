1. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

Below would be O(1) because it will always return n in constant time. If `n` equals 1, it will return "Goodbye World! 1". There is no iteration or conditional logic. The only variable is the machine processing the template literal with the variable.

```ruby
def goodbye_world(n)
 puts "Goodbye World! #{n}"
end
```

2. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

Below would be O(n); The largest is a constant time activity and doesn't affect complexity. The collection's iteration's method useage of length is also a constant time activity to derive `n`. The times method iterates over `n` as `i` for each iteration.

`if collection[i] >= largest` is a constant time activity which will never change by comparing an object in the array to the object assigned as `largest`.

`largest = collection[i]` is also a constant time activity by moving the pointer `largest` to a new index location on the `collection`.

```ruby
def find_largest(collection)
 largest = collection[0]
 collection.length.times do |i|
   if collection[i] >= largest
     largest = collection[i]
   end
 end
 largest
end
```
3. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

Below would be O(n^2); The largest is a constant time activity and doesn't affect complexity. The collection's iteration's method useage of length is also a constant time activity to derive `n`. The times method iterates over `n` as `i` for each iteration. This would be O(n).

The assignment of `subcollection`'s pointer is a constant time activity and doesn't affect complexity.

Upon the second loop for `subcollection`, would convert O(n) to O(n^2).

`if subcollection[i] >= largest` is a constant time activity which will never change by comparing an object in the array to the object assigned as `largest`.

The reassignment of `largest` is a constant time activity.

So, this would be O(n^2)

```ruby
def find_largest(collection)
 largest = collection[0][0]
 collection.length.times do |i|
   subcollection = collection[i]
   subcollection.length.times do |j|
     if subcollection[j] >= largest
       largest = subcollection[j]
     end
   end
 end
 largest
end
```
4. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

O(2^n)

k = T(0) = T(1) = 1
C = 5, which is the number of actions needed to pass through two conditions, call a recursive call twice, and add the returned result together.

  T(n) = T(n-1) + T(n-2) + C

ASSUMING T(n-1) ≈ T(n-2)

  T(n) = 2T(n-1) + C
       = 2^kT(n - k) + (2^k - 1)C

IF n - k = 0 => k = n

  T(n) = 2^nT(0) + (2^n - 1)C
       = (1+C)2^n - C

  T(n) ∝ 2^n

```ruby
def numbers(n)
 if (n == 0)
   return 0
 elsif (n == 1)
   return 1
 else
   return numbers(n-1) + numbers(n-2)
 end
end
```
5. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

O(n)

Each iteration will run in constant time but there will be `n` iterations making it O(n).

```ruby
def iterative(n)
 num1 = 0
 num2 = 1

 i = 0
 while i < n-1
   tmp = num1 + num2
   num1 = num2
   num2 = tmp
   i+=1
 end

 num2
end
```

6. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

O(n^2)

The Loop is O(n), however, the recursive call will change the internal constant. Each recursive call builds off eachother (i.e. n-1 => n-2 => n-3) with the pivot partition moving. This end up as C((n+1)(n/2)-1) which would be further reduced to n^2 or O(n^2).



```ruby
def sort(collection, from=0, to=nil)
 if to == nil
   # Sort the whole collection, by default
   to = collection.count - 1
 end

 if from >= to
   # Done sorting
   return
 end

 # Take a pivot value, at the far left
 pivot = collection[from]

 # Min and Max pointers
 min = from
 max = to

 # Current free slot
 free = min

 while min < max
   if free == min # Evaluate collection[max]
     if collection[max] <= pivot # Smaller than pivot, must move
       collection[free] = collection[max]
       min += 1
       free = max
     else
       max -= 1
     end
   elsif free == max # Evaluate collection[min]
     if collection[min] >= pivot # Bigger than pivot, must move
       collection[free] = collection[min]
       max -= 1
       free = min
     else
       min += 1
     end
   else
     raise "Inconsistent state"
   end
 end

 collection[free] = pivot

 sort collection, from, free - 1
 sort collection, free + 1, to

 collection
end
```