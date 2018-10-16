require_relative "tsp_greed"
RSpec.describe 'TSP Tests' do
  subject(:tour) { Tour.new(City.new) }
  let(:tour_with_itinerary) { tour.create_itinerary }
  describe Tour do
    context 'cities should be listed on the map' do
      it 'should be an array and greater than 0' do
        expect(tour.map.cities).to be_a(Array)
        expect(tour.map.cities.count).to be > 0
      end
      it 'should include cities' do
        expect(tour.map.cities.first).to be_a(City)
      end
    end
    context 'itinerary should list cities' do
      it 'should be an array and greater than 0' do
        expect(tour_with_itinerary).to be_a(Array)
        expect(tour_with_itinerary.count).to be > 0
      end
      it 'should include cities' do
        expect(tour_with_itinerary.first).to be_a(City)
      end
    end
    context 'cities and itinerary' do
      it 'should have the same number of cities' do
        expect(tour_with_itinerary.count).to eq(tour.map.cities.count)
      end
      it 'itinerary should include each city' do
        itinerary = tour.create_itinerary
        cities = tour.map.cities
        itinerary.each do |item|
          expect(cities).to include(item)
        end
      end
    end
  end
end