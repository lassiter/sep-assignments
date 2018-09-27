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
    # Manage Seen Films
    @visited = []
    # Manage Film Chain
    @chain = []
    @data = data
    @max_depth = 6
  end

  # Write a function that begins at a provided Node object and returns an 
  # Array of at most six film titles that connect it to the Kevin_Bacon Node.
  def find_kevin_bacon(actor_name_string)
    return nil if actor_name_string.nil? || actor_name_string === "nil"
    actor_node = self.data.find {|x| x.name === actor_name_string }
    # Find the Baconator
    kevin_bacon = bfs(actor_node, "Kevin Bacon", 0)
    result = """
      We found #{actor_name_string} -> Kevin Bacon via '#{@chain.join(' -> ')}'
    """
    puts result
    binding.pry
    return kevin_bacon
  end

  # breadth first search
  def bfs(node, search_key, depth)
    return nil if node === nil || search_key === nil || depth === nil
    return node if node.name === search_key
    return nil if @max_depth < depth
    node.film_actor_hash.each do |film, actor_node|
      if !@visited.include?(film)
        actor_node.each do |n|
          if n.visited === false
            n.visited = true
            @chain << film if n.name === search_key
            return n if n.name === search_key
            bfs(n, search_key ,depth + 1) if n.name != search_key
          end
        end
        @visited << film
      end
    end
  end
end

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