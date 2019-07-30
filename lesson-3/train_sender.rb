# frozen_string_literal: true

require_relative 'menu_printer'

class TrainSender
  extend MenuPrinter

  OPTIONS = ['1 - Начать',
             '0 - Назад'].freeze

  class << self
    attr_reader :trains, :stations
    def call(trains, stations)
      @stations = stations
      @trains = trains
      run_loop
    end

    private

    def run_loop
      loop do
        print_menu OPTIONS
        case user_answer
        when 1
          train_to_station
        else
          break
        end
      end
    end

    def train_to_station
      raise unless [trains, stations].map(&:empty?)

      print_list(trains, TRAIN_MESSAGE, 'number')
      train = choose_train
      print_list(stations, STATION_MESSAGE, 'name')
      station = choose_station
      raise unless station && train

      station.receive_train(train)
      puts 'Успех'
    end

    def choose_station
      print FIND_STATION_MESSAGE
      choose_element(stations)
    end

    def choose_train
      print FIND_TRAIN_MESSAGE
      choose_element(trains)
    end

    def choose_element(array)
      index = input_index(array.length)
      array[index]
    end
  end
end
