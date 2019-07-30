# frozen_string_literal: true

require_relative 'train'
require_relative 'cargo_carriage'

class CargoTrain < Train
  TYPE = :cargo
  CARRIAGE_TYPE = CargoCarriage

  def type_info
    'грузовой'
  end
end
