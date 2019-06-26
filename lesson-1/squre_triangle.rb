# frozen_string_literal: true

print 'Введие а: '
a = gets.chomp.to_i
print 'Введие h: '
h = gets.chomp.to_i

if a.positive? && h.positive?
  puts "Площадь треугольника равна #{1.0 / 2.0 * a * h} см^2"
else
  puts 'Неверный ввод'
end
