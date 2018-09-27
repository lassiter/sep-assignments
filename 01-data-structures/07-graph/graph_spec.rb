include RSpec

require_relative 'node'
require_relative 'graph'

RSpec.describe Graph, type: Class do
  let(:warehouse) { Warehouse.new("data.csv") }
  let(:graph) { Graph.new(warehouse.data) }

  describe 'should be able to find Kevin Bacon' do
    it 'should handle nil' do
      subject = graph.find_kevin_bacon(nil)
      expect(subject).to be nil
    end

    it 'should handle unknown strings' do
      subject = graph.find_kevin_bacon("foo bar")
      expect(subject).to be nil
    end

    it 'in 1 degree' do
      # via Castmate Tom Hanks in Apollo 13
      subject = graph.find_kevin_bacon("Tom Hanks")
      binding.pry
      expect(subject.name).to eq("Kevin Bacon")
    end

    it 'in 2 degrees' do
      # via Laurence Fishburne
      subject = graph.find_kevin_bacon("Keanu Reeves")
        binding.pry
      expect(subject.name).to eq("Kevin Bacon")
    end

    it 'in 3 degrees' do
      # via Tom Bower -> Marcia Gay Harden
      subject = graph.find_kevin_bacon("Anna Felix")
      expect(subject.name).to eq("Kevin Bacon")
    end

    it 'in 4 degrees' do
      # via Jeff Bridges -> Tom Bower -> Marcia Gay Harden
      subject = graph.find_kevin_bacon("Leslie Bibb")
      expect(subject.name).to eq("Kevin Bacon")
    end

    it 'in 5 degrees' do
      # via Amy Adams -> Robin Williams -> Matt Damon -> Tom Hanks
      subject = graph.find_kevin_bacon("Christian Bale")
      expect(subject.name).to eq("Kevin Bacon")
    end

    it 'in 6 degrees' do
      # via Christian Bale -> Amy Adams -> Robin Williams -> Matt Damon -> Tom Hanks
      subject = graph.find_kevin_bacon("Gary Oldman")
      expect(subject.name).to eq("Kevin Bacon")
    end

  end
  describe 'should not be able to find Kevin Bacon' do
    
    it 'in 7 degrees' do
      # via Gary Oldman -> Christian Bale -> Amy Adams -> Robin Williams -> Matt Damon -> Tom Hanks
      subject = graph.find_kevin_bacon("Giancarlo Giannini")
      expect(subject.name).to eq("Kevin Bacon")
    end

  end

end