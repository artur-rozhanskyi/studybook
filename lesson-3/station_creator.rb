# frozen_string_literal: true

require_relative 'menu_printer'
require_relative 'object_adder'
class StationCreator
  extend MenuPrinter
  extend ObjectAdder
  NEW_STATION_MESSAGE = 'Введите название станции'
  OPTIONS = ['1 - Создание станции',
             '0 - Назад'].freeze
  class << self
    attr_accessor :stations
    def call(stations)
      @stations = stations
      run_loop
    end

    private

    def run_loop
      loop do
        print_menu OPTIONS
        case user_answer
        when 1
          create_station
        else
          break
        end
      end
    end

    def create_station
      puts NEW_STATION_MESSAGE
      create_obj_add_to_array(
        class_name: Station,
        array: stations,
        attr_name: 'name',
        input: user_input
      )
    end
  end
end
