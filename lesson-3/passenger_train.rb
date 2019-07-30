# frozen_string_literal: true

require_relative 'passenger_carriage'

class PassengerTrain < Train
  TYPE = :passenger
  CARRIAGE_TYPE = PassengerCarriage

  def type_info
    'пассажирский'
  end
end
