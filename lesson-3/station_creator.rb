# frozen_string_literal: true

require_relative 'menu_printer'
require_relative 'object_finder'
require_relative 'validation_error'

class StationCreator
  extend MenuPrinter
  extend ObjectFinder
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
      input = user_input
      Station.new(input).tap { |obj| stations << obj } unless find(stations, 'name', input)
      puts 'Станция создана'
    rescue StandardError => e
      puts e.message
      retry
    end
  end
end
