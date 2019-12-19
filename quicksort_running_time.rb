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

def partition(arr, first, last)
  pivot = arr[last]
  p_index = first
  swaps = 0

  i = first
  while i < last
    if arr[i] <= pivot
      temp = arr[i]
      arr[i] = arr[p_index]
      arr[p_index] = temp
      p_index += 1
      swaps += 1
    end
    i += 1
  end
  temp = arr[p_index]
  arr[p_index] = pivot
  arr[last] = temp
  swaps += 1
  [p_index, swaps]
end

def advanced_quicksort(arr, first = 0, last = arr.length - 1, total_swaps = [])
  if first < last
    p_index, swaps = partition(arr, first, last)
    total_swaps.push(swaps)
    advanced_quicksort(arr, first, p_index - 1, total_swaps)
    advanced_quicksort(arr, p_index + 1, last, total_swaps)
  end
  total_swaps.sum
end

def quicksort_running_time(array)
  # write your code here
  insertion_array = array.dup
  quick_array = array.dup
  running_time(insertion_array) - advanced_quicksort(quick_array)
end

p quicksort_running_time([1, 3, 9, 8, 2, 7, 5])
