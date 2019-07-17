# frozen_string_literal: true

describe CargoTrain do
  let!(:cargo_train) { described_class.new('number') }
  let(:cargo_carriage) { CargoCarriage.new }
  let(:type) { :cargo }

  describe '#type' do
    it { expect(cargo_train.type).to eq(type) }
  end

  describe '#hook_carriage' do
    it { expect { cargo_train.hook_carriage(cargo_carriage) }.to change { cargo_train.carriages.length }.by(1) }
  end

  it_behaves_like 'train_unhook_carriage', CargoCarriage
end
