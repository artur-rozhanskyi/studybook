# frozen_string_literal: true

array = %w[а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ ь ы ъ э ю я]
vowoles = %w[а е ё и о у ы э ю я]
array.each_with_object({}) { |l, hsh| hsh[l] = array.index(l) }
     .select { |letter, _value| vowoles.include?(letter) }
     .each { |k, v| puts "'#{k}' - #{v}" }
