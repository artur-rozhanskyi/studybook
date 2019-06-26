# frozen_string_literal: true

def days_in_months(month_amount)
  day_sum = 0
  while month_amount > 1
    month_amount -= 1
    day_sum += month_day(month_amount)
  end
  day_sum
end

def month_day(month_number)
  {
    1 => 31,
    2 => 28,
    3 => 31,
    4 => 30,
    5 => 31,
    6 => 30,
    7 => 31,
    8 => 31,
    9 => 30,
    10 => 31,
    11 => 30,
    12 => 31
  }[month_number]
end

print 'Введие год: '
year = gets.chomp.to_i
print 'Введие месяц: '
month = gets.chomp.to_i
print 'Введие день: '
day = gets.chomp.to_i

if (1..31).to_a.include?(day) || [1..12].include?(month)
  if (year % 4).zero? && year % 100 != 0 || (year % 400).zero?
    # 366
    puts "Номер дня #{day + days_in_months(month) + 1}"
  else
    # 365
    puts "Номер дня #{day + days_in_months(month)}"
  end
else
  puts (1..31).to_a.include?(day)
  puts month
  puts "Ошибка ввода"
end