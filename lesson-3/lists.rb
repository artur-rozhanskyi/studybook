# frozen_string_literal: true

require_relative 'menu_printer'
class Lists
  extend MenuPrinter

  OPTIONS = ['1 - Станции',
             '2 - Поезда',
             '0 - Назад'].freeze

  class << self
    attr_reader :stations, :trains
    def call(trains, stations)
      @stations = stations
      @trains = trains
      run_loop
    end

    private

    # rubocop:disable Metrics/MethodLength
    def run_loop
      loop do
        print_menu OPTIONS
        case user_answer
        when 1
          stations_list
        when 2
          trains_list
        else
          break
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

    def stations_list
      print_list(stations, STATION_MESSAGE, 'name')
    end

    def trains_list
      print_list(trains, TRAIN_MESSAGE, 'number')
    end
  end
end
