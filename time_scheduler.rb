# frozen_string_literal: true

def time_scheduler(array)
  # write your code here
  new_array = (0...array.length).step(2).collect { |index| [array[index], array[index + 1]] }
  new_array .sort_by! { |element| element[1] }
  scheduler = []
  scheduler.push(new_array[0])

  (1...new_array.length).each do |i|
    if scheduler.last[1] > new_array[i][0] &&
       (scheduler.last[1] - scheduler.last[0] > new_array[i][1] - new_array[i][0])
      scheduler.pop
      scheduler.push(new_array[i])
    elsif scheduler.last[1] <= new_array[i][0]
      scheduler.push(new_array[i])
    end
  end
  scheduler
end

p time_scheduler([2, 6, 5, 10, 7, 12, 0, 9, 4, 8])
# p time_scheduler([4, 8, 1, 3, 7, 9, 5, 6])
# => [[1,3], [5,6], [7,9]]
