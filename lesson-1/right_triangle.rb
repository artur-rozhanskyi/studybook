# frozen_string_literal: true

print 'Введие а: '
a = gets.chomp.to_i
print 'Введие b: '
b = gets.chomp.to_i
print 'Введие c: '
c = gets.chomp.to_i

side_arr = [a, b, c]

hypotenuse = side_arr.max
side_arr.slice!(side_arr.index(hypotenuse))

if hypotenuse**2 == side_arr[0]**2 + side_arr[1]**2
  puts 'Треугольник прямоугольный'
  puts 'и равнобедренный' if side_arr[0] == side_arr [1]
else
  puts 'Треугольник не прямоугольный'
end
