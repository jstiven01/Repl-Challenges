# frozen_string_literal: true

def isValid(coins, array, k, val)
  coins.count(val) > array.count(val) && array.inject(0, :+) + val <= k ? true : false
end

def exact_sum?(k, coins, position = 0, array = [0] * coins.length)
  return true if array.inject(0, :+) == k

  coins.each_with_index do |val, _index|
    next unless isValid(coins, array, k, val)

    array[position] = val
    return true if exact_sum?(k, coins, position + 1, array)

    array[position] = 0
  end
  false
end

# puts exact_sum?(12, [1, 2, 3, 4, 5])
# => true

puts exact_sum?(11, [1, 5, 9, 13])
# => false
