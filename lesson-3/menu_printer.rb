# frozen_string_literal: true

require_relative 'object_adder'

module MenuPrinter
  private

  def print_menu(menu)
    puts "\n"
    menu.each { |element| puts element }
    print 'Ваш выбор: '
  end

  def menu_include?(menu, input)
    (0...menu.size).include? input
  end

  def user_answer
    input = user_input
    while input !~ /\A[0-9]\z/
      puts 'Неверный ввод'
      print 'Повторите: '
      input = user_input
    end
    input.to_i
  end

  def user_input
    gets.chomp
  end

  def user_input_int
    user_input.to_i
  end

  def print_list(array, message, attr_name)
    if array.empty?
      puts EMPTY_LIST_MESSAGE
    else
      array.each_with_index do |val, index|
        puts "#{index} - #{message} #{instance_attribute_value(val, attr_name)}"
      end
    end
  end

  def input_index(length)
    inp = user_answer
    until [0, length - 1].include?(inp)
      puts 'Такого индекса нет'
      print 'Повторите: '
      inp = user_answer
    end
    inp
  end

  def instance_attribute_value(instance, attr_name)
    instance.instance_variable_get("@#{attr_name.to_sym}")
  end
end
