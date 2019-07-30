# frozen_string_literal: true

describe PassengerTrain do
  let(:passenger_train) { build(:passenger_train) }

  it_behaves_like 'train_hook_carriage' do
    let(:train) { passenger_train }
    let(:carriage) { build(:passenger_carriage) }
  end

  it_behaves_like 'train_unhook_carriage' do
    let(:train) { build(:passenger_train, :with_carriage) }
  end
end
