# frozen_string_literal: true

shared_examples_for 'train_hook_carriage' do |class_carriage|
  let(:carriage) { class_carriage.new }

  it {
    expect { train.hook_carriage(carriage) }
      .to change { train.carriages.length }.by(1)
  }
end
