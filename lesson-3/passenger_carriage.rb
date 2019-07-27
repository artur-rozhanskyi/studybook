# frozen_string_literal: true

class PassengerCarriage < Carriage
  attr_reader :seats, :occupied_seats

  def initialize(seats)
    @seats = seats
    @occupied_seats = 0
  end

  def take_seat
    raise FullFillCarriage, 'All seats occupied' if available_seats.zero?

    self.occupied_seats += 1
  end

  def available_seats
    seats - occupied_seats
  end

  def info
    "#{occupied_seats}/#{seats}"
  end

  private

  attr_writer :seats, :occupied_seats
end
