# frozen_string_literal: true

def insertion_sort(index, array)
  # write your code here
  initial_value = array[index]

  index.downto(0).each do |current_index|
    if current_index - 1 >= 0 && initial_value <= array[current_index - 1]
      array[current_index] = array[current_index - 1]
    elsif current_index.zero? && array[current_index] > initial_value
      array[current_index] = initial_value
    elsif current_index - 1 >= 0 && initial_value > array[current_index - 1]
      array[current_index] = initial_value
      break
    end
  end
  array
end

def sort_itself(array)
  # write your code here
  (1...array.length).each do |i|
    print insertion_sort(i, array).join(' ') + "\n"
  end
end

sort_itself([1, 4, 3, 6, 9, 2])
