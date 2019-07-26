# frozen_string_literal: true

describe PassengerTrain do
  let(:passenger_train) { build(:passenger_train) }

  describe '#type' do
    let(:type) { :passenger }

    it { expect(passenger_train.type).to eq(type) }
  end

  it_behaves_like 'train_hook_carriage', PassengerCarriage do
    let(:train) { passenger_train }
  end

  it_behaves_like 'train_unhook_carriage' do
    let(:train) { build(:passenger_train, :with_carriage) }
  end
end
