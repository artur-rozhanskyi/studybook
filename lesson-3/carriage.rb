# frozen_string_literal: true

require_relative 'manufacturer'

class Carriage
  include Manufacturer
  def type
    self.class::TYPE
  end
end
