require 'rubygems'
gem 'faker'
require "faker"
require "pry"

class City
  attr_accessor :name
  attr_accessor :x
  attr_accessor :y
  attr_accessor :visited
  attr_accessor :neighbors

  def initialize( x = nil, y = nil)
    self.name = Faker::Address.city
    self.x = x || rand * 200
    self.y = y || rand * 200
    self.neighbors = []
    self.visited = false
  end

  def to_s
    "#{self.x}, #{self.y}"
  end

end

class Map
  attr_accessor :cities
  attr_accessor :graph
  def initialize(starting_city)
    a = [starting_city].concat Array.new(rand(9..15)) {|item| item = City.new }
    @cities = a.each do |city|
      while city.neighbors.count <= (a.length/3)
        new_neighbor = a.sample
        unless city.neighbors.include?(new_neighbor) || city.name === new_neighbor.name
          new_neighbor.neighbors << city
          city.neighbors << new_neighbor
        end
      end
    end
  end
end


class Tour
  attr_accessor :map
  attr_accessor :itinerary
  attr_accessor :current_city

  def initialize(starting_city)
    return "Need a starting city." unless starting_city.kind_of?(City)
    starting_city.visited = true
    @map = Map.new(starting_city)
    @current_city = self.map.cities.first
    @itinerary = [self.current_city]
    p "starting in #{self.current_city.name} with #{self.map.cities.count} cities"
  end

  def create_itinerary
    while !self.map.cities.all? { |city| city.visited === true}
      next_city = nearest_possible_neighbor(self.current_city)
        p "currently in #{self.current_city.name}"
        if next_city.visited === false
          next_city.visited = true
          self.itinerary << next_city
          self.current_city = next_city
        end
    end
    # while self.map.cities.count != self.itinerary.count
    # end
    puts "Just finished trip itinerary with #{self.itinerary.count} cities"
    self.itinerary.each {|i| puts i.name}
  end

  def nearest_possible_neighbor(current_city)
    neighbor_cities = current_city.neighbors
    if neighbor_cities.all? {|x| x.visited === true}
      self.current_city = self.itinerary[-2]
      neighbor_cities = self.current_city.neighbors
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

end


t = Tour.new(City.new).create_itinerary