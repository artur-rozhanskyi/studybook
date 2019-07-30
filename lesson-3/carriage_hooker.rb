# frozen_string_literal: true

require_relative 'menu_printer'
class CarriageHooker
  extend MenuPrinter
  OPTIONS = ['1 - Добавить',
             '0 - Назад'].freeze
  TYPE_CAPACITY = ['общее количество мест', 'общий объем'].freeze
  class << self
    attr_accessor :trains
    def call(trains)
      @trains = trains
      run_loop
    end

    def hook_carriages
      print_list(trains, TRAIN_MESSAGE, 'number')
      return if trains.empty?

      train = train_selection
      hook_quantity(train, holding_capacity)
      print "Вагонов: #{train.carriages.length}"
    end

    def hook_quantity(train, holding_capacity)
      quantity.times { train.hook_carriage(train.class::CARRIAGE_TYPE.new(holding_capacity)) }
    end

    def train_selection
      print FIND_TRAIN_MESSAGE
      trains[input_index(trains.length)]
    end

    def holding_capacity
      print 'Введите объем/количество мест: '
      user_input_int
    end

    def quantity
      print HOOK_MESSAGE
      user_input_int
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
