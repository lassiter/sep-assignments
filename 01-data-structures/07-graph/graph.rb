require "pry"
require 'csv'
require_relative 'node'

class Graph
  attr_accessor :data
  attr_accessor :graph
  attr_accessor :stack

  def initialize(graph)
    @graph = graph
    @stack = stack
    @data = data # Warehouse.new("data.csv")
  end

  # Write a function that begins at a provided Node object and returns an 
  # Array of at most six film titles that connect it to the Kevin_Bacon Node.
  def find_kevin_bacon(starting_node)
    # Find the Baconator
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
        puts "Added #{node.inspect} and @data has #{data.length}"
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
        puts "Linked #{potential_cast_node.name} and #{node.name} as castmates in #{movie_key}"
      end
    end
  end

end