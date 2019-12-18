# frozen_string_literal: true

def partition(array)
  array_left = array.select { |element| element < array.first }
  array_right = array.select { |element| element > array.first }

  [array_left, [array.first], array_right]
end

def simple_quicksort(array)
  return array if array.size <= 1

  left, pivot, right = partition(array)
  result = simple_quicksort(left) + [pivot] + simple_quicksort(right)
  puts result.join(' ')
  result
end

simple_quicksort([5, 8, 1, 3, 7, 10, 2])
