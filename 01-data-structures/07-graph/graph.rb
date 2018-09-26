require "pry"
require 'csv'
require_relative 'node'

class Graph
  attr_accessor :data
  attr_accessor :graph
  attr_accessor :stack
  attr_reader :max_depth

  def initialize(data)
    @graph = graph
    @stack = stack
    @data = data
    @max_depth = 6
  end

  # Write a function that begins at a provided Node object and returns an 
  # Array of at most six film titles that connect it to the Kevin_Bacon Node.
  def find_kevin_bacon(actor_name_string)
    return nil if actor_name_string.nil? || actor_name_string === "nil"
    actor_node = self.data.bsearch {|x| x.name === actor_name_string }

    # Find the Baconator
    kevin_bacon = iterative_depth_search(actor_node)

  end

  # Iterative Depth Search
  def iterative_depth_search(root)
    for i in 0..@max_depth
      found, remaining = depth_limited_search(root, i)
      binding.pry if found
      if !found.nil? && found.kind_of?(Node)
        binding.pry
        return found
      elsif !remaining
        return -1
      end
      puts i
    end
    binding.pry
    # node.film_actor_hash.keys.each do |film_title|
    #   node.film_actor_hash[film_title].each do |child_node|
    #     bacon_search(child_node)
    #   end
    # end
  end

  # Depth Limited Search
  def depth_limited_search(node, depth)
    if depth <= @max_depth
      [nil, false]
    end
    if depth === 0
      if node.name === "Kevin Bacon"
        result = [node, true]
        return result
      elsif node.film_actor_hash.any?
        result = [nil, true]
        return result
      else
        result = [nil, false]
        return result
      end
    elsif depth > 0 && depth <= @max_depth
      node.film_actor_hash.keys.each do |film_title|
        node.film_actor_hash[film_title].each do |child_node|
          # If node child is Kevin Bacon, return the bacon;
          # Else go one level deeper.
          if child_node.name === "Kevin Bacon"
            result = [child_node, true]
            return result
          elsif depth <= @max_depth
            found, remaining = depth_limited_search(child_node, depth + 1)
            result = [found, remaining]
            return result
          else
            result = [nil, false]
            return result
          end
        end # child_node loop
      end # film_title loop
    else
      result = [nil, true]
      return result
    end
  end

end

      #  any_remaining ← false
      #  foreach child of node
      #      found, remaining ← DLS(child, depth−1)
      #      if found ≠ null
      #          return (found, true)   
      #      if remaining
      #          any_remaining ← true    (At least one node found at depth, let IDDFS deepen)
      #  return (null, any_remaining)


# Helper Class to handle converting csv files to nodes
# and their respective film_actor_hashes
# Example: 
#  Kevin_Bacon.film_actor_hash['Footloose'] = 
#   [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker, …]
class Warehouse
  attr_accessor :data

  def initialize(path)
    @data = []
    header = ["Actor Name", "Class", "Movie"]
    # Transfer CSV Content to Unique Nodes with Hashes
    CSV.foreach(path) do |row|
      next if row === header
      existing_node = does_actor_node_exist(row[0])

      # If true, insert new movie into existing node;
      # If false, insert new node with movie
      if existing_node.nil?
        node = Node.new(row[0], Hash.new)
        node.film_actor_hash[row[2]] = []
        @data << node
      else
        if existing_node.film_actor_hash.include?(row[2])
          puts "duplicate movie addition for node: #{node.inspect}"
        else
          existing_node.film_actor_hash[row[2]] = []
        end
      end
    end

    # Fill Movie hashes for all nodes based on
    # titles for each node.
    # Example:
    # Node1.film_actor_hash.keys = ["Matrix"]
    # Node2.film_actor_hash.keys = ["Matrix"]
    # Node1.film_actor_hash["Matrix"] << Node2.name
    # Node2.film_actor_hash["Matrix"] << Node1.name
    # Node1.film_actor_hash["Matrix"]; returns Node2.name.to_str
    # Node2.film_actor_hash["Matrix"]; returns Node1.name.to_str
    @data.each do |node|
      node.film_actor_hash.keys.each do |movie_key|
        link_node_to_movie_cast(node, movie_key)
      end
    end

  end

  def does_actor_node_exist(actor_name)
    @data.each do |node|
      return node if node.name === actor_name
    end
    return nil
  end

  def link_node_to_movie_cast(node, movie_key)
    @data.each do |potential_cast_node|
      next if potential_cast_node === node
      if potential_cast_node.film_actor_hash.keys.include?(movie_key) && !potential_cast_node.film_actor_hash[movie_key].include?(node)
        potential_cast_node.film_actor_hash[movie_key] << node
        node.film_actor_hash[movie_key] << potential_cast_node
      end
    end
  end

end