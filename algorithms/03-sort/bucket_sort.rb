require "pry"
  def bucket_sort(array)
    return array if array.length <= 1
    buckets = Array.new((array.max/10)+1)
    
    array.each do |item|
      if buckets[item/10].nil?
        buckets[item/10] = [item]
      else
        buckets[item/10].concat([item])
      end
    end

    buckets.each do |bucket|
      next if bucket === nil || bucket.size === 1
      bucket.sort!
    end
    return buckets.flatten
  end