require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  # Places Key Value pair at an index.
  def []=(key, value)
    inital_index = index(key,@size)
    node = Node.new(key, value)
    # Immediate Placement of Key Pair
    if @items[inital_index].nil?
      @items[inital_index] = node
    elsif @items[next_open_index(inital_index)].nil?
      open_index = next_open_index(inital_index)
      return @items[open_index] = node
    else
      resize
      if @items[inital_index].nil?
        return @items[inital_index] = node
      elsif @items[next_open_index(inital_index)].nil?
        open_index = next_open_index(inital_index)
        return @items[open_index] = node
      else
        while @items[index(key,@size)] != nil
          resize
          return @items[index(key,@size)] = node if @items[index(key,@size)].nil?
          return @items[next_open_index(index(key,@size))] = node if @items[next_open_index(index(key,@size))].nil?
        end
      end
    end
  end

  # Returns value that matches key.
  def [](key)
    expected_index = index(key,@size)
    # Expected Index Matches Key
    if @items[expected_index].key == key
      return @items[expected_index].value
    # Loop Starting at expected_index
    elsif @items[expected_index].nil? || @items[expected_index].key != key
      i = expected_index
      while i < @size
        if !@items[i].nil? && key == @items[i].key
          return @items[i].value
        end
        i += 1
      end
    end
    return "Not Found"
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    return -1 if @items.all? {|item| !item.nil?}
    (index..@size-1).each do |i|
      return i if @items[i].nil?
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size *= 2
    rehashed = Array.new(@size)
    @items.each do |item|
      unless item.nil?
        rehashed[index(item.key,@size)] = item
      end
    end
    @items = rehashed
  end
end