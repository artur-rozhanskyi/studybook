# frozen_string_literal: true

def fibonachi_to_array(arr)
  (0..50).each do |number|
    num_buf = fibonachi(number)
    break if num_buf > 100

    arr << num_buf
  end
end

def fibonachi(number)
  return 0 if number.zero?
  return 1 if number == 1

  fibonachi(number - 2) + fibonachi(number - 1)
end

my_arr_fibon = []
fibonachi_to_array(my_arr_fibon)
puts my_arr_fibon
