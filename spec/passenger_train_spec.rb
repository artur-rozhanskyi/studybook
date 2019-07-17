# frozen_string_literal: true

describe PassengerTrain do
  let(:passenger_train) { described_class.new('number') }
  let(:passenger_carriage) { PassengerCarriage.new }

  describe '#type' do
    let(:type) { :passenger }

    it { expect(passenger_train.type).to eq(type) }
  end

  describe '#hook_carriage' do
    it {
      expect { passenger_train.hook_carriage(passenger_carriage) }
        .to change { passenger_train.carriages.length }.by(1)
    }
  end

  it_behaves_like 'train_unhook_carriage', PassengerCarriage
end
