require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @item_count = 0
    @size = size
  end

  def []=(key, value)
      # Inital method values
      i = index(key,@size)
      node = Node.new(key, value)

      # Collision Handler
      if @items[i].nil?
        llist = LinkedList.new
      else
        llist = @items[i]
      end
      llist.add_to_tail(node)
      @items[i] = llist
      @item_count += 1
      resize if load_factor > @max_load_factor
  end

  def [](key)
    llist = @items[index(key,@size)]
    return if llist.nil?

    current_node = llist.head
    # Loops until tail incrementing node_count
    while current_node.key != key
      current_node = current_node.next
    end
    return current_node.value   
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    puts "Load Factor: #{new_load_factor = @item_count / @size.to_f}"
    return new_load_factor
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size *= 2
    rehashed = Array.new(@size)
    @items.each do |list|
      unless list.nil?
        current_node = list.head
        until current_node == nil
          i = index(current_node.key, @size)
          rehashed[i] = LinkedList.new unless rehashed[i].kind_of?(LinkedList)
          rehashed[i].add_to_tail(current_node)
          current_node = current_node.next
        end
      end
      list = nil
    end
    @items = rehashed
  end

  def print_all_hashes
    @items.each do |item|
      unless item.nil?
        current_node = item.head
        until current_node == nil
          puts "Print: #{current_node.key} => #{current_node.value}"
          current_node = current_node.next
        end
      end
    end
    load_factor
  end
end
