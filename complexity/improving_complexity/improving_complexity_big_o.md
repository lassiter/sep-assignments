- Version 1

Version one is O(n^2) because in the worst case `n = sorted_array = combined_array-1` resulting in n^2.

- Version 2

Version two is O(n log(n)) because of merge sort.

- Version 3

Version two is O(n log(n)) because of heap sort.

There isn't a way to improve space complexity because the multiple arrays passed via the splat. It'll always be the same or more with an insertion sort. The best case is using a heap_sort to deal with space but it won't actually affect the greater arrays that bloat the size unless you remove the splat.

- Flatten method used in methods
m = number of arrays
k = max depth of arrays
T(m) = m^k

I believe all of the versions have a factor of `m^k` tied into the complexity, if I understand the function and C code correctly. (I don't know C.)

https://ruby-doc.org/core-2.2.0/Array.html#method-i-flatten

```c
static VALUE
rb_ary_flatten(int argc, VALUE *argv, VALUE ary)
{
    int mod = 0, level = -1;
    VALUE result, lv;

    rb_scan_args(argc, argv, "01", &lv);
    if (!NIL_P(lv)) level = NUM2INT(lv);
    if (level == 0) return ary_make_shared_copy(ary);

    result = flatten(ary, level, &mod);
    OBJ_INFECT(result, ary);

    return result;
}
```