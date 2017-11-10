# this checks if a credit card # is valid
def is_valid?(card_number)
  # does this card have a valid type
  type = card_type(card_number)

  if type === 'invalid'
    puts " This is an invalid card number"
    return
  else
    index = card_number.digits.count-1
    step1 = 0
    step2 = 0
    (0..index).each do |i|
      if (i + 1) % 2 == 0
        step1 += multiply(card_number.digits[i])
      else
        step2 += card_number.digits[i]
      end
      i += 1
    end

    if (step1 + step2) % 10 == 0
      return puts "This is a valid #{type} number"
    else
      return puts "This is an invalid card number"
    end
  end
end

def multiply(num)
  result = num * 2
  if result > 9
    result = result.digits[0] + result.digits[1]
  end
  return result
end

def card_type(card_num)
  # The last digit in card_num is the first digit of the card number
  # 4 - visa
  # 5 mastercard
  # 6 Discover
  # 37 amex

  first_digit = card_num.digits.last

  case first_digit
  when 3
    if card_num.digits[card_num.size - 2] === 7
      return 'American Express'
    else
      return 'invalid'
    end
  when 4
    return 'Visa'
  when 5
    return 'MasterCard'
  when 6
    return 'Discover'
  else
    return 'invalid'
  end
end

# actually run is_valid?
puts 'Please enter your credit card number'
is_valid?(gets.chomp.to_i)
