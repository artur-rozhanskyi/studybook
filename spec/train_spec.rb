# frozen_string_literal: true

describe Train do
  let(:number) { '123' }
  let(:train) { described_class.new(number) }

  describe '.find' do
    let(:cargo_number) { 'number1' }
    let!(:cargo_train) { CargoTrain.new(cargo_number) }

    it { expect(described_class.find(cargo_number)).to eq(cargo_train) }
  end

  describe '#accelerating_by' do
    let(:speed) { 100 }

    it { expect { train.accelerating_by(speed) }.to change(train, :speed).by(speed) }
  end

  describe '#stop' do
    it { expect(train.stop).to be_zero }
  end

  describe '#receive_route' do
    let(:route) { Route.new(Station.new('station2'), Station.new('station1')) }

    before { train.receive_route(route) }

    it { expect(train.route).to eq(route) }
    it { expect(train.current_station_number).to be_zero }
  end
end
