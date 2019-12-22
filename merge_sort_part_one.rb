# frozen_string_literal: true

def merge_sort(array1, array2)
  # write your code here
  new_array = []
  index_array1 = 0
  index_array2 = 0
  while index_array1 < array1.length
    if index_array2 < array2.length && array1[index_array1] > array2[index_array2]
      new_array.push(array2[index_array2])
      index_array2 += 1
    else
      new_array.push(array1[index_array1])
      index_array1 += 1
    end
  end

  new_array += array2.slice(index_array2, array2.length - index_array2) if index_array2 < array2.length
  new_array
end

p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
# => [1, 2, 3, 4, 6, 8, 9, 11]
