# frozen_string_literal: true

def substract_number(data_string)
  data_string.scan(/\d+/).first.to_i
end

def merge_sort(array1, array2)
  # write your code here
  new_array = []
  index_array1 = 0
  index_array2 = 0
  while index_array1 < array1.length
    if index_array2 < array2.length && substract_number(array1[index_array1]) > substract_number(array2[index_array2])
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

def merge_sort_rec(array)
  if array.length > 1
    arr1 = merge_sort_rec(array.slice(0, array.length / 2))
    arr2 = merge_sort_rec(array.slice(array.length / 2, array.length - array.length / 2))
    merge_sort(arr1, arr2)
  else
    array
  end
end

def full_merge_sort(array)
  # write your code here

  merge_sort_rec(array).map { |element| element.gsub(/\s+/, '').delete('0-9') }
end

p full_merge_sort(['0 ab', '6 cd', '0 ef', '6 gh', '4 ij', '0 ab', '6 cd', '0 ef', '6 gh', '0 ij', '4 that', '3 be', '0 to', '1 be', '5 question', '1 or', '2 not', '4 is', '2 to', '4 the'])
