require 'rubygems'
gem 'faker'
gem 'json'
require "faker"
require 'json'

class City
  attr_accessor :name
  attr_accessor :x
  attr_accessor :y
  attr_accessor :visited
  attr_accessor :neighbors

  def initialize( x = nil, y = nil, neighbors, name)
    self.name = name || Faker::Address.city
    self.x = x || rand * 200
    self.y = y || rand * 200
    self.neighbors = neighbors
    self.visited = false
  end

end

class Map
  attr_accessor :cities
  def initialize(path)
    self.cities = []
    file = File.read(path)
    JSON.parse(file)["data"].each do |hash|
      @cities << City.new(hash["x"], hash["y"], hash["neighbors"], hash["name"])
    end
  end
end


class Tour
  attr_accessor :map
  attr_accessor :itinerary
  attr_accessor :current_city

  def initialize(starting_map)
    return "Need a starting map." unless starting_map.kind_of?(Map)
    @map = starting_map
    @current_city = self.map.cities.first
    current_city.visited = true
    @itinerary = [self.current_city.name]
  end

  def create_itinerary
    while !self.map.cities.all? { |city| city.visited === true}
      next_city = nearest_possible_neighbor(self.current_city)
        if next_city.visited === false
          next_city.visited = true
          self.itinerary << next_city.name
          self.current_city = next_city
        end
    end
    return self.itinerary
  end

  def nearest_possible_neighbor(current_city)
    neighbor_cities = []
    self.map.cities.each do |city|
      if current_city.neighbors.include?(city.name) && !@itinerary.include?(city.name)
        neighbor_cities << city
      end
    end
    nearest_neighbor = neighbor_cities.min_by {|x| distance(current_city, x)}
    while !neighbor_cities.empty? && nearest_neighbor.visited === true
      neighbor_cities.delete(nearest_neighbor)
      nearest_neighbor = neighbor_cities.min_by {|x| distance(current_city, x)}
    end
    return nearest_neighbor
  end

  def distance(current_city, other_city)
    x_distance = (current_city.x - other_city.x).abs
    y_distance = ( current_city.y - other_city.y).abs
    Math.sqrt( x_distance.abs2 + y_distance.abs2 )
  end

  def self.test_distance(current_city, other_city)
    x_distance = (current_city.x - other_city.x).abs
    y_distance = ( current_city.y - other_city.y).abs
    Math.sqrt( x_distance.abs2 + y_distance.abs2 )
  end

end