# frozen_string_literal: true

describe Station do
  let(:station) { build(:station, :with_train) }
  let(:station_2) { build(:station, name: 'Station-2') }
  let(:train) { build(:train) }
  let(:number) { train.number }

  describe '#receive_train' do
    it { expect { station.receive_train(train) }.to change(station, :trains).to include(train) }
  end

  describe '#send_train' do
    it 'pops up train' do
      station.receive_train(train)
      expect { station.send_train(number) }.to change { station.trains.length }.by(-1)
    end
  end

  describe '.all' do
    it { expect(described_class.all).to include(station, station_2) }
  end

  it_behaves_like 'validatable', described_class, 'station' do
    let(:valid_object) { station }
  end

  describe '#each_train' do
    it { expect { |b| station.each_train(&b) }.to yield_control }
  end
end
