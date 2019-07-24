# frozen_string_literal: true

describe InstanceCounter do
  let(:my_class) do
    Class.new do
      include InstanceCounter
      def initialize
        register_instance
      end
    end
  end

  describe '#register_instance' do
    it { expect { my_class.new }.to change(my_class, :instances).by(1) }
  end
end
