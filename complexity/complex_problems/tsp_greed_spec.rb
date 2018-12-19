require_relative "tsp_greed"
require "pry"
RSpec.describe 'TSP Tests' do
  let(:map) { Map.new("data.json") }
  subject(:tour) { Tour.new(map) }
  let(:expected_itinerary) {["Lake Carmellamouth", "Fallout", "Wilfredport", "Deanport", "Lake Margstad"]}

  describe Tour do
    context 'cities and itinerary' do
      it 'should have the same number of cities' do
        expect(tour.create_itinerary.count).to eq(expected_itinerary.count)
      end
      it 'itinerary should include each city' do
        tour.map.cities.each do |city|
          expect(expected_itinerary).to include(city.name)
        end
      end
      it 'nearest neighbor is correct' do
        expect(tour.create_itinerary).to eq(expected_itinerary)
      end
    end
  end
end