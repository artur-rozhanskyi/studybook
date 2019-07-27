# frozen_string_literal: true

describe Route do
  let(:route) { build(:route) }
  let(:station_name) { 'Station3' }
  let(:mediate_station) { build(:station, name: station_name) }
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
