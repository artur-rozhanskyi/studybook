# frozen_string_literal: true

def purchase_enter(purchase_hash)
  loop do
    print 'Введие название: '
    title = gets.chomp
    break if title =~ /[(C|cтоп)]/

    print 'Введие цену: '
    price = gets.chomp.to_i
    print 'Введие количество: '
    quattity = gets.chomp.to_i
    purchase_hash[title] = { price: price, quattity: quattity }
  end
end

def dashes(number)
  '-' * number
end

def print_purchase(purchase_hash)
  amount_check = 0
  purchase_hash.each do |title, value|
    money = value[:quattity] * value[:price]
    puts "#{title}\n   Цена: #{value[:price]}"
    puts "   Количество: #{value[:quattity]} \n#{dashes(20)}"
    puts "Сумма: #{money}\n#{dashes(20)}"
    amount_check += money
  end
  puts "#{dashes(50)}\nИтого: #{amount_check}"
end

my_purchase = {}
if purchase_enter(my_purchase)
  print_purchase(my_purchase)
else
  puts 'Ошибка ввода'
end
