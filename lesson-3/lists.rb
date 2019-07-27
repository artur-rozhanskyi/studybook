# frozen_string_literal: true

require_relative 'menu_printer'
class Lists
  extend MenuPrinter

  OPTIONS = ['1 - Станции',
             '2 - Поезда',
             '3 - Поезда на станциях',
             '4 - Вагоны поездов',
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
      print_list(stations, STATION_MESSAGE, 'name') do |station|
        train_details(station.trains)
      end
    end

    def trains_list
      train_details(trains)
    end

    def train_details(trains = [])
      print_list(trains, TRAIN_MESSAGE, 'number') do |train|
        puts "\tТип: #{train.type_info}"
        puts "\tКоличество вагонов: #{train.carriages.length}"
        train.each_carriage.with_index do |carriage, i|
          print "\t\tВагон № #{i} Тип: #{train.type_info} "
          puts carriage.info
        end
      end
    end
  end
end
