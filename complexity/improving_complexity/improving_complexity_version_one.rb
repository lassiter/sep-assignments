require "pry"
# Create a version of the code above that has code optimizations.
# This method takes n arrays as input and combine them in sorted ascending order
 def poorly_written_ruby_1(*array_collection)
   combined_array = array_collection.flatten
   sorted_array = [combined_array.delete_at(combined_array.length-1)]
  

   for val in combined_array
     i = 0
     while i < sorted_array.length
       if val <= sorted_array[i]
         sorted_array.insert(i, val)
         break
       elsif i == sorted_array.length - 1
         sorted_array << val
         break
       end
       i+=1
     end
   end

   # Return the sorted array
   sorted_array
 end