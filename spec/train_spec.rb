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

  describe '#each_carriage' do
    let(:train_with_carriage) { build(:cargo_train, :with_carriage) }

    it { expect { |b| train_with_carriage.each_carriage(&b) }.to yield_control }
  end

  it_behaves_like 'nil_validation', :train, :number
  it_behaves_like 'format_validation', :train, :number, 'qwerty'
  it_behaves_like 'type_validation', :train, :number, 12_345
end
