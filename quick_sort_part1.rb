# frozen_string_literal: true

def partition(array)
  # write your code here
  array_left = array.select { |element| element < array.first }
  array_right = array.select { |element| element >= array.first }
  array_left.concat(array_right)
end

p partition([4, 5, 3, 9, 1])
# => [3, 1, 4, 5, 9]
