# frozen_string_literal: true

class CargoCarriage < Carriage
  attr_reader :capacity, :occupied_capacity

  def initialize(seats)
    @capacity = seats
    @occupied_capacity = 0
  end

  def fill(fill_level)
    raise FullFillCarriage, 'Carriage is full fill' if available_capacity < fill_level

    self.occupied_capacity += fill_level
  end

  def available_capacity
    capacity - occupied_capacity
  end

  def info
    "#{occupied_capacity}/#{capacity}"
  end

  private

  attr_writer :capacity, :occupied_capacity
end
