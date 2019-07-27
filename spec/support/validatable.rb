# frozen_string_literal: true

shared_examples_for 'validatable' do |class_name, invalid_param|
  it { expect(valid_object).to be_valid }

  it do
    expect do
      class_name.new(invalid_param)
    end
      .to raise_error ValidationError
  end
end
