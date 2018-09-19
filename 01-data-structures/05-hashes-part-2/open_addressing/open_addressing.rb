require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    # Inital method values
    # puts """
    
    # Key #{key}
    # Value #{value}

    # """
    inital_index = index(key,@size)
    node = Node.new(key, value)
    if @items[inital_index].nil?
      @items[inital_index] = node
      # puts @items[inital_index].inspect
    else
      i = inital_index
      while !@items[i].nil? && i < @size
        @items[i] = node if @items[i].nil?
        i+=1
        if i == @size
          resize
          if @items[inital_index].nil?
            return @items[inital_index] = node
          else
            open_index = next_open_index(inital_index)
            return @items[open_index] = node
          end
        end
      end
    end
  end

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
      return "Not Found"
    else
      if @items[expected_index].key == key
        return @items[expected_index].value
      end
    end
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