# Author: Robin Goyal
# frozen_string_literal: true
module LuhnValidator

  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    # last digit is the check digit
    check_digit = nums_a.pop

    # reverse the array
    validate_num = nums_a.reverse!
    # double every second digit
    validate_num.each_with_index do |num, index|
      validate_num[index] = transform_digit(num) if index.even?
    end

    ((validate_num.sum + check_digit) % 10).zero?
  end

  def transform_digit(num)
    num *= 2
    num -= 9 if num > 9
    num
  end
end
