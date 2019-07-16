# frozen_string_literal: true

require_relative 'menu_printer'
class CarriageHooker
  extend MenuPrinter
  OPTIONS = ['1 - Добавить',
             '0 - Назад'].freeze
  class << self
    attr_accessor :trains
    def call(trains)
      @trains = trains
      run_loop
    end

    def hook_carriages
      print_list(trains, TRAIN_MESSAGE, 'number')
      print FIND_TRAIN_MESSAGE
      index = input_index(trains.length)
      train = trains[index]
      print HOOK_MESSAGE
      hook_count(train, user_input_int)
      print "Вагонов: #{train.carriages.length}"
    end

    def carriage_class_name(train)
      case train.type
      when :cargo
        CargoCarriage
      when :passenger
        PassengerCarriage
      end
    end

    def hook_count(train, count)
      count.times { train.hook_carriage(carriage_class_name(train).new) }
    end

    private

    def run_loop
      loop do
        print_menu(OPTIONS)
        case user_answer
        when 1
          hook_carriages
        else
          break
        end
      end
    end
  end
end
