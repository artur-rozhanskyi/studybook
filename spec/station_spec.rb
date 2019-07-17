# frozen_string_literal: true

describe Station do
  let(:station) { described_class.new('station1') }
  let(:station_2) { described_class.new('station2') }
  let(:train) { Train.new(number) }
  let(:number) { 'number' }

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
end
