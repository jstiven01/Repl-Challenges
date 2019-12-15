# frozen_string_literal: true

def insertion_sort(array)
  # write your code here
  initial_value = array.last

  (array.length - 1).downto(0).each do |current_index|
    if current_index - 1 >= 0 && initial_value <= array[current_index - 1]
      array[current_index] = array[current_index - 1]
      print array.join(' ') + "\n"
    elsif current_index.zero? && array[current_index] > initial_value
      array[current_index] = initial_value
      print array.join(' ') + "\n"
    elsif current_index - 1 >= 0 && initial_value > array[current_index - 1]
      array[current_index] = initial_value
      print array.join(' ') + "\n"
      break
    end
  end
end

insertion_sort([1, 3, 2])
