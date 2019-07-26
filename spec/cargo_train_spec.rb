# frozen_string_literal: true

describe CargoTrain do
  let(:cargo_train) { build(:cargo_train) }

  describe '#type' do
    it { expect(cargo_train.type).to eq(:cargo) }
  end

  it_behaves_like 'train_hook_carriage', CargoCarriage do
    let(:train) { cargo_train }
  end

  it_behaves_like 'train_unhook_carriage' do
    let(:train) { build(:cargo_train, :with_carriage) }
  end
end
