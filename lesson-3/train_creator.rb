# frozen_string_literal: true

require_relative 'menu_printer'
require_relative 'object_finder'
class TrainCreator
  extend MenuPrinter
  extend ObjectFinder
  OPTIONS = ['1 - Создание пассажирского поезда',
             '2 - Создание грузового поезда',
             '0 - Назад'].freeze
  class << self
    attr_accessor :trains
    def call(trains)
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
          create_passenger_train
        when 2
          create_cargo_train
        else
          break
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

    def create_cargo_train
      create_train(CargoTrain)
    end

    def create_passenger_train
      create_train(PassengerTrain)
    end

    def create_train(class_name)
      puts NEW_TRAIN_MESSAGE
      input = user_input
      class_name.new(input).tap { |obj| trains << obj } unless find(trains, 'number', input)
      puts 'Поезд создан'
    rescue StandardError => e
      puts e.message
      retry
    end
  end
end
