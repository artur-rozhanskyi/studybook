# frozen_string_literal: true

require_relative 'config'

class RailwayManager
  extend MenuPrinter
  OPTIONS = ['1 - Создать станции',
             '2 - Создать поезда',
             '3 - Добавить вагоны к поезду',
             '4 - Отцепить вагоны от поезда',
             '5 - Помеcтить поезд на станцию',
             '6 - Показать список',
             'Любой символ - Выход'].freeze
  @trains = []
  @stations = []
  @routes = []
  class << self
    attr_accessor :trains, :stations, :routes

    def load_settings
      @stations = YAML.safe_load(File.read(PATH_STATIONS_DATA),
                                 [Station, CargoTrain, PassengerTrain, CargoCarriage, PassengerCarriage])
      stations.each { |station| station.each_train { |train| trains << train } }
    end

    def run
      load_settings
      run_loop
    end

    private

    # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/AbcSize
    def run_loop
      loop do
        print_menu OPTIONS
        case user_answer
        when 1
          StationCreator.call(stations)
        when 2
          TrainCreator.call(trains)
        when 3
          CarriageHooker.call(trains)
        when 4
          CarriageUnhooker.call(trains)
        when 5
          TrainSender.call(trains, stations)
        when 6
          Lists.call(trains, stations)
        else
          break
        end
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/AbcSize
  end
end
