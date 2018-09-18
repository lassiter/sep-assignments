class Node
  attr_accessor :next
  attr_accessor :key
  attr_accessor :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

# class Node
#   attr_accessor :next
#   attr_accessor :data

#   def initialize(data)
#     @data = data
#   end
# end