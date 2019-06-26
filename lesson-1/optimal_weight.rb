# frozen_string_literal: true

print 'Введите имя: '
name = gets.chomp
print 'Введите рост: '
height = gets.chomp.to_f

weight = height - 110

if weight.positive?
  puts "#{name}, ваш оптимальный вес #{weight}"
else
  puts 'Ваш вес оптимальный'
end
