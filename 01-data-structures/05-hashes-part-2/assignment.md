1. Create two versions of your HashClass. Use the appropriate spec and skeleton files in sep-assignments to create Hash classes which support the following collision strategies:
 - Separate Chaining
 - Open Addressing (using either Linear Probing, Quadratic Probing, or Double Hashing)
2. Create a function capable of printing the state of your HashClass to the console.
 - This function must present the location and value of each entry in a readily understood way.
 - This function must also print the hash’s Load Factor.
 - Use this function to verify the behavior of each HashClass after a series of insertions.
 - Present the output of this function in the submission tab.
3. Written Assignment
 - Describe three collision resolution strategies not mentioned here.
 - Create your own collision resolution strategy and describe how it works.

### Describe three collision resolution strategies

1. 2-choice hashing
2-choice hashing allows h1(x) and h2(x) to create two locations to place an object which allows the algorithm or method to choose one of the two locations based on prefrences, likely the density of the objects in a certain area of the table.

2. Hopscotch hashing
Hopscotch hashing takes the best of cuckoo hashing and linear probing and essentially creates a scoped area of a table to search making it logarithmic in the worst case. If it can't find a slot nearby, it will recursively relocate other objects in the area of the inital value until there is room in it's area to place the value.

    Here is how to add item x which was hashed to bucket i:
    
    If the entry i is empty, add x to i and return.
    Starting at entry i, use a linear probe to find an empty entry at index j.
    If the empty entry's index j is within H-1 of entry i, place x there and return. Otherwise, entry j is too far from i. To create an empty entry closer to i, find an item y whose hash value lies between i and j, but within H-1 of j. Displacing y to j creates a new empty slot closer to i. Repeat until the empty entry is within H-1 of entry i, place x there and return. If no such item y exists, or if the bucket i already contains H items, resize and rehash the table.
  ["Hopscotch hashing", Wikipedia](https://en.wikipedia.org/wiki/Hopscotch_hashing)
3. Coalesced hashing
Coalesced hashing is a hybrid of separate chaining and open addressing which if a hashA matches hashB it will be chained to that address. This process makes it memory heavy because the load factor must be balanced to make it performant.

### Create your own collision resolution strategy and describe how it works.

This is how I'd add an item to a bucket:

1. If the entry i is empty, add x to i and return.
  A. If, a new subarray, Order the sub-array by ascii value of the first character in the key.
2. If the entry i has j but both keys are unique with unique inital characters, step A or B, else #3.
  A. If, an exisitng subarray with unique unique intial character, Order the sub-array by ascii value of the first character in the key.
  B. If, an existing subarray without unique intial character, insert i by ascii value of the first character in the key and on conflict #4.
3. If the entry i has j but both keys are equal, resize.
4. If the entry i has j but both keys are unique with inital characters being equal, resize.

Resize would be n*2.