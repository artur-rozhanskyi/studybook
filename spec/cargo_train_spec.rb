# frozen_string_literal: true

describe CargoTrain do
  let(:cargo_train) { build(:cargo_train) }

  it_behaves_like 'train_hook_carriage', CargoCarriage do
    let(:train) { cargo_train }
    let(:carriage) { build(:cargo_carriage) }
  end

  it_behaves_like 'train_unhook_carriage' do
    let(:train) { build(:cargo_train, :with_carriage) }
  end
end
