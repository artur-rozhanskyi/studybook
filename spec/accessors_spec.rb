# frozen_string_literal: true

describe Accessors do
  let(:prime_value) { 1 }
  let(:my_class) do
    Class.new do
      include Accessors
      attr_accessor_with_history :my_variable
      strong_attr_acessor :my_strong_variable, Integer

      def initialize(my_variable)
        @my_variable = my_variable
      end
    end
  end
  let(:my_instance) { my_class.new(prime_value) }

  describe '#my_variable_with_history' do
    let(:value_1) { 5 }
    let(:value_2) { 10 }

    it {
      my_instance.my_variable = value_1
      my_instance.my_variable = value_2
      expect(my_instance.my_variable_history).to eq([prime_value, value_1, value_2])
    }
  end

  describe '#strong_attr_acessor_setter' do
    subject(:wrong_assignment) { my_instance.my_strong_variable = wrong_value }

    let(:wrong_value) { 'string' }

    it { expect { wrong_assignment } .to raise_error ArgumentError }
  end
end
