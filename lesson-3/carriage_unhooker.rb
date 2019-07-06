# frozen_string_literal: true

require_relative 'menu_printer'
class CarriageUnhooker
  extend MenuPrinter
  OPTIONS = ['1 - Отцепить',
             '0 - Назад'].freeze
  class << self
    attr_accessor :trains, :train
    def call(trains)
      @trains = trains
      run_loop
    end

    private

    def run_loop
      loop do
        print_menu(OPTIONS)
        case user_answer
        when 1
          unhook_carriages
        else
          break
        end
      end
    end

    def unhook_carriages
      print_list(trains, 'Поезд', 'number')
      print FIND_TRAIN_MESSAGE
      tr = trains[input_index(trains.length)]
      print UNHOOK_MESSAGE
      count = user_input_int
      unhook_count(tr, count)
      print "Вагонов: #{tr.carriages.length}"
    end

    def unhook_count(train, count)
      count.times { train.unhook_carriage }
    end
  end
end
