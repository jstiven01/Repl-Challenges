# frozen_string_literal: true

def insertion_sort(index, array)
  # write your code here
  initial_value = array[index]
  shifts = 0
  index.downto(0).each do |current_index|
    if current_index - 1 >= 0 && initial_value < array[current_index - 1]
      array[current_index] = array[current_index - 1]
      shifts += 1
    elsif current_index.zero? && array[current_index] >= initial_value
      array[current_index] = initial_value
    elsif current_index - 1 >= 0 && initial_value >= array[current_index - 1]
      array[current_index] = initial_value
      break
    end
  end
  shifts
end

def running_time(array)
  # write your code here
  number_shifts = 0
  (1...array.length).each do |i|
    number_shifts += insertion_sort(i, array)
  end
  number_shifts
end

puts running_time([2, 1, 3, 1, 2])
# => 4
