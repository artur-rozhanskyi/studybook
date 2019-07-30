# frozen_string_literal: true

describe Route do
  let(:route) { build(:route) }
  let(:station_name) { 'Station3' }
  let(:mediate_station) { build(:station, name: station_name) }
  let(:index_after_station) { 0 }
  let(:index_mediate_station) { route.stations.index { |s| s.name == station_name } }

  describe '#add_mediate_station' do
    let(:last_index) { route.stations.length - 1 }
    let(:negative_index) { -1 }

    it 'allocates in right possition' do
      route.add_mediate_station index_after_station, mediate_station
      expect(index_mediate_station).to eq(index_after_station + 1)
    end

    it 'raises if index_after_station.negative?' do
      expect { route.add_mediate_station(negative_index, mediate_station) }.to raise_error IndexError
    end

    it 'raises more_then_last?(index_after_station)' do
      expect { route.add_mediate_station(last_index, mediate_station) }.to raise_error IndexError
    end
  end

  describe '#delete_mediate_station' do
    let(:route_with_mid_station) { build(:route, :with_mediate_station) }
    let(:name_first_station) { route_with_mid_station.stations.first.name }
    let(:name_last_station) { route_with_mid_station.stations.last.name }

    it {
      expect { route_with_mid_station.delete_mediate_station station_name }
        .to change { route_with_mid_station.stations.length }.by(-1)
    }

    it 'raises if first station' do
      expect { route_with_mid_station.delete_mediate_station name_first_station }.to raise_error NameError
    end
    it 'raises if last station' do
      expect { route_with_mid_station.delete_mediate_station name_last_station }.to raise_error NameError
    end
  end
end
