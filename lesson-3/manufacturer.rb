# frozen_string_literal: true

module Manufacturer
  def specify_manufacturer(manufacturer_name)
    self.manufacturer_name = manufacturer_name
  end

  def manufacturer
    manufacturer_name
  end

  protected

  attr_accessor :manufacturer_name
end
