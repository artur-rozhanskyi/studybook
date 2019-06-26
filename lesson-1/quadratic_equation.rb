# frozen_string_literal: true

print 'Введие а: '
a = gets.chomp.to_i
print 'Введие b: '
b = gets.chomp.to_i
print 'Введие c: '
c = gets.chomp.to_i

d = b**2 - 4 * a * c

if d.negative?
  puts 'Корней нет'
elsif d.zero?
  puts "х1 = х2 = #{-b / 2 * a}"
elsif d.positive?	
  puts "x1 = #{(-b + Math.sqrt(d)) / 2 * a}"
  puts "x2 = #{(-b - Math.sqrt(d)) / 2 * a}"
end
