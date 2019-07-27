# frozen_string_literal: true

require_relative 'manufacturer'

class Carriage
  include Manufacturer

  def info
    raise NotImplementedError
  end
end
