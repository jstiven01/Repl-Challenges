# frozen_string_literal: true

require 'set'
def duplicates(arr1, arr2)
  # write your code here
  new_set = Set.new(arr1)
  duplicates = []
  new_set.each do |element|
    duplicates.push(element) if arr1.count(element) != arr2.count(element)
  end
  duplicates.sort
end

p duplicates([10, 3, 17, 11, 5, 10, 3, 9, 11, 33, 41, 22, 8, 17, 3, 11, 35, 52, 73, 88], [22, 3, 10, 11, 33, 41, 11, 5, 3, 17, 10, 3, 9, 11, 52, 73, 88, 35, 10, 11, 3, 8, 17, 8])
# => [204, 205, 206]
