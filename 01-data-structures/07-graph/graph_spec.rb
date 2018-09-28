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
      expect(graph.find_kevin_bacon("foo bar")).to eq("We didn't find foo bar as a name in our data.")
    end

    it 'in 1 degree' do
      # Co-stars in Mystic River
      expect(graph.find_kevin_bacon("Laurence Fishburne")).to eq("We found Laurence Fishburne -> Kevin Bacon via 'Mystic River'")
    end

    it 'in 2 degrees' do
      # via Laurence Fishburne
      expect(graph.find_kevin_bacon("Keanu Reeves")).to eq("We found Keanu Reeves -> Kevin Bacon via 'Matrix, The -> Mystic River'")
    end

    it 'in 3 degrees' do
      # via Tom Bower -> Marcia Gay Harden
      expect(graph.find_kevin_bacon("Anna Felix")).to eq("We found Anna Felix -> Kevin Bacon via 'Crazy Heart -> Pollock -> Apollo 13'")
    end

    it 'in 4 degrees' do
      # via Jeff Bridges -> Tom Bower -> Marcia Gay Harden
      expect(graph.find_kevin_bacon("Leslie Bibb")).to eq("We found Leslie Bibb -> Kevin Bacon via 'Iron Man -> Crazy Heart -> Pollock -> Apollo 13'")
    end

    it 'in 5 degrees' do
      # via Amy Adams -> Robin Williams -> Matt Damon -> Tom Hanks
      expect(graph.find_kevin_bacon("Christian Bale")).to eq("We found Christian Bale -> Kevin Bacon via 'The Fighter -> Night at the Museum: Battle of the Smithsonian -> Good Will Hunting -> Saving Private Ryan -> Apollo 13'")
    end

    it 'in 6 degrees' do
      # via Christian Bale -> Amy Adams -> Robin Williams -> Matt Damon -> Tom Hanks
      expect(graph.find_kevin_bacon("Gary Oldman")).to eq("We found Gary Oldman -> Kevin Bacon via 'The Dark Knight Rises -> The Fighter -> Night at the Museum: Battle of the Smithsonian -> Good Will Hunting -> Saving Private Ryan -> Apollo 13'")
    end

  end
  describe 'should not be able to find Kevin Bacon' do
    
    it 'in 7 degrees' do
      # via Gary Oldman -> Christian Bale -> Amy Adams -> Robin Williams -> Matt Damon -> Tom Hanks
      expect(graph.find_kevin_bacon("Giancarlo Giannini")).to eq("We found Giancarlo Giannini -> Kevin Bacon, but apparently Kevin's world is larger than 6 degrees.")
    end

    it 'if there is no connection' do
      expect(graph.find_kevin_bacon("Gillian Anderson")).to eq("We found Gillian Anderson but we didn't find a connection to Kevin Bacon.")
    end

  end

end