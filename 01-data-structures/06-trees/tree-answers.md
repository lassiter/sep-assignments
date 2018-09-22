How much time does an average insertion consume in the Binary Search Tree compared to the Heap?
```
Insert Start
       user     system      total        real
binary tree insert  0.630000   0.010000   0.640000 (  0.633431)
min heap insert  0.510000   0.000000   0.510000 (  0.522748)
```

How much time does finding 50000 in the Binary Search Tree consume compared to the Heap?
```
Find Start
       user     system      total        real
binary tree find  0.040000   0.000000   0.040000 (  0.038962)
min heap find  0.010000   0.000000   0.010000 (  0.010188)
```

How much time does the average deletion consume in a Binary Search Tree compared to the Heap?
```
Delete Start
       user     system      total        real
binary tree find  0.040000   0.000000   0.040000 (  0.037660)
min heap find  0.010000   0.000000   0.010000 (  0.009737)
````

When would you use a Binary Search Tree and why?
If memory storage was an issue and wasn't able to have large blocks of memory dedicated to storage; and, If I needed fast lookups, because the tree is localized for search because the way it's setup. It would be impossible for 1000 to be in the same tree as 499 in a range of 1-1000. If I have a hash, I would need 1..n*resize pointers for memory while with a tree I just need n with metadata for children and parents. In a data storage case, I think it would be good for quick storage of large node profiles that don't need to be sorted in a particular way but are never really deleted.

When would you use an Heap and why?
If memory storage was an issue and wasn't able to have large blocks of memory dedicated to storage. If I needed fast lookups on a paticular range and in the case for movie ratings, a max-heap based on a movie rating would be useful for a recommendation system because the best rated movies are self-organized at the top of the tree while the lower ratings are lower at the tree.

Regarding Binary Trees and Heaps, I wouldn't use it for data that often needs to be hard deleted but if it's a type of data that can be soft deleted then it's fine. Heaps and Binary trees in a sense are the same coin with specific purposes.