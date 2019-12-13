# frozen_string_literal: true

def appears_most_times(array)
  # write your code here
  hash_appears = {}
  array.each do |element|
    if hash_appears.key?(element)
      hash_appears[element] += 1
    else
      hash_appears[element] = 1
    end
  end
  hash_appears.max_by { |_k, v| v }[0]
end

puts appears_most_times([1, 2, 3, 1, 5])
# => 1

puts appears_most_times([23, 43, 67, 88, 42, 35, 77, 88, 99, 11])
# => 88

puts appears_most_times([4376, -345, -345, 4376, -345, 84_945, 4376,
                         -345, -26_509, 4376, 84_945, 84_945, -26_509, 896_341, 4376])
# => 4376
