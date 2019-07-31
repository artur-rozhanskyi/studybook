# frozen_string_literal: true

shared_examples_for 'type_validation' do |object_name, invalid_param, invalid_type|
  let(:invalid_object) { build(object_name, invalid_param => invalid_type) }
  it "returns false if #{invalid_param} has invalid type" do
    expect(invalid_object).not_to be_valid
  end

  it 'returns validation format message' do
    invalid_object.valid?
    expect(invalid_object.errors[invalid_param][:type]).to eq("#{invalid_param.capitalize} wrong type")
  end
end
