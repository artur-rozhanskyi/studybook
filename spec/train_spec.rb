# frozen_string_literal: true

describe Train do
  let(:train) { build(:train) }

  describe '.find' do
    let(:number) { 'qwe-13' }
    let!(:train_new) { described_class.new(number) }

    it { expect(described_class.find(number)).to eq(train_new) }
  end

  describe '#accelerating_by' do
    let(:speed) { 100 }

    it { expect { train.accelerating_by(speed) }.to change(train, :speed).by(speed) }
  end

  describe '#stop' do
    it { expect(train.stop).to be_zero }
  end

  describe '#receive_route' do
    let(:route) { build(:route) }

    before { train.receive_route(route) }

    it { expect(train.route).to eq(route) }
    it { expect(train.current_station_number).to be_zero }
  end

  it_behaves_like 'validatable', described_class, 'qwertyu' do
    let(:valid_object) { train }
  end
end
