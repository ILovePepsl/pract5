def conv_in_roman(number) #из арабских в римские
  rom = {
    1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 10 => 'X',
    40 => 'XL', 50 => 'L', 90 => 'XC', 100 => 'C',
    400 => 'CD', 500 => 'D', 900 => 'CM', 1000 => 'M' }.freeze


  result = ''
  rom.keys.reverse_each do |value|
    while number >= value
      result << rom[value]
      number -= value
    end
  end

  result

end #def conv_in_roman(number)

def conv_in_arabic(number) #из римских в арабские
  arab = {
    'I' => 1, 'IV' => 4, 'V' => 5, 'IX' => 9, 'X' => 10,
    'XL' => 40, 'L' => 50, 'XC' => 90, 'C' => 100,
    'CD' => 400, 'D' => 500, 'CM' => 900, 'M' => 1000
  }.freeze

  result = 0
  i = 0

  while i < number.length
    current_char = number[i]

    if arab.key?(current_char)
      if i + 1 < number.length
        current_symbol = current_char
        next_symbol = number[i + 1]

        if arab.key?(current_symbol + next_symbol)
          result += arab[current_symbol + next_symbol]
          i += 2
        else
          result += arab[current_char]
          i += 1
        end
      else
        result += arab[current_char]
        i += 1
      end
    end
  end

  result

end #def conv_in_arabic(number)


print 'number converter'

loop do
  print <<here

1.convert from arabic to roman
2.convert from roman to arabic
3.exit
your choice:
here

  case gets.to_i
  when 1
    print 'enter the number to convert:'
    number_ar = gets.to_i
    puts "| #{number_ar} in roman version: #{conv_in_roman(number_ar)} |"
  when 2
    print 'enter the number to convert:'
    number_rom = gets.chomp
    puts "| #{number_rom} in arabic version: #{conv_in_arabic(number_rom)} |"
  when 3
    break
  else
    puts 'you entered an invalid value!'
  end

end #loop do





#для быстрой проверки корректности перевода чисел
# loop do
#   number = gets.to_i
#   puts "| #{number} in roman version: #{conv_in_roman(number)} |"
#   puts "| #{conv_in_roman(number)} in arabic version: #{conv_in_arabic(conv_in_roman(number))} |"
# end