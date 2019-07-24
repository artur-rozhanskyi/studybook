# frozen_string_literal: true

shared_examples_for 'train_unhook_carriage' do |carriage_class|
  let(:train) { described_class.new('number') }
  let(:carriage) { carriage_class.new }
  let(:error_message_speed) { "Speed is'n zero" }
  let(:error_message_carriages) { 'No carriages' }

  before do
    train.hook_carriage(carriage)
  end

  it { expect { train.unhook_carriage }.to change { train.carriages.length }.by(-1) }

  context 'when carriages number is zero' do
    it { expect { 2.times { train.unhook_carriage } }.to raise_exception error_message_carriages }
  end

  context 'when train speed is not zero' do
    it {
      train.accelerating_by(100)
      expect { train.unhook_carriage }.to raise_exception error_message_speed
    }
  end
end
