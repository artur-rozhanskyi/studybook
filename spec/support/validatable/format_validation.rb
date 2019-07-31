# frozen_string_literal: true

shared_examples_for 'format_validation' do |object_name, invalid_param, invalid_string|
  let(:invalid_object) { build(object_name, invalid_param => invalid_string) }
  it "returns false if #{invalid_param} has invalid format" do
    expect(invalid_object).not_to be_valid
  end

  it 'returns validation format message' do
    invalid_object.valid?
    expect(invalid_object.errors[invalid_param][:format]).to eq("#{invalid_param.capitalize} is not valid")
  end
end
