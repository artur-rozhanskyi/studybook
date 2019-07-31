# frozen_string_literal: true

shared_examples_for 'nil_validation' do |object_name, invalid_param|
  let(:invalid_object) { build(object_name, invalid_param => nil) }
  it 'returns false if name is nil' do
    expect(invalid_object).not_to be_valid
  end

  it 'returns validation nil message' do
    invalid_object.valid?
    expect(invalid_object.errors[invalid_param][:presence]).to eq("#{invalid_param.capitalize} can't be nil")
  end
end
