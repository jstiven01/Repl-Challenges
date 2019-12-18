# frozen_string_literal: true

def partition(arr, first, last)
  pivot = arr[last]
  p_index = first

  i = first
  while i < last
    if arr[i] <= pivot
      temp = arr[i]
      arr[i] = arr[p_index]
      arr[p_index] = temp
      p_index += 1
    end
    i += 1
  end
  temp = arr[p_index]
  arr[p_index] = pivot
  arr[last] = temp
  p_index
end

def advanced_quicksort(arr, first = 0, last = arr.length - 1)
  if first < last
    p_index = partition(arr, first, last)
    p arr
    advanced_quicksort(arr, first, p_index - 1)
    advanced_quicksort(arr, p_index + 1, last)
  end
  arr
end

advanced_quicksort([1, 3, 9, 8, 2, 7, 5])
