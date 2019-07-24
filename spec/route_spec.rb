# frozen_string_literal: true

describe Route do
  let(:route) { described_class.new(Station.new('station1'), Station.new('station2')) }
  let(:station_name) { 'station3' }
  let(:mediate_station) { Station.new(station_name) }
  let(:index_after_station) { 0 }
  let(:index_mediate_station) { route.stations.index { |s| s.name == station_name } }

  before do
    route.add_mediate_station index_after_station, mediate_station
  end

  describe '#add_mediate_station' do
    it 'allocates in right possition' do
      expect(index_mediate_station).to eq(index_after_station + 1)
    end
  end

  describe '#delete_mediate_station' do
    it { expect { route.delete_mediate_station station_name }.to change { route.stations.length }.by(-1) }
  end
end
