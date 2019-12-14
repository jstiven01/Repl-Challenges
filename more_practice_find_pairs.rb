# frozen_string_literal: true

def find_pairs(array, k)
  find_pairs = {}
  array.each do |element|
    if array.include?(k - element) && (!find_pairs.key?(k - element) && !find_pairs.key?(element))
      find_pairs[element] = [element, k - element]
    end
  end
  find_pairs.values
end

p find_pairs([1, 9, 11, 13, 2, 3, 7], 12)
# => [[1, 11], [9, 3]]
