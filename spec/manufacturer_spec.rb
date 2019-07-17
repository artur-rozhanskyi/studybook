# frozen_string_literal: true

describe Manufacturer do
  let(:my_class) { Class.new { include Manufacturer } }
  let(:my_instance) { my_class.new }
  let(:manufacturer_name) { 'manufacturer_name' }

  describe '#manufacturer' do
    before do
      my_instance.specify_manufacturer(manufacturer_name)
    end

    it { expect(my_instance.manufacturer).to eq(manufacturer_name) }
  end
end
