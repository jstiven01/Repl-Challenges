# frozen_string_literal: true

def greatest_peaks(map)
  peaks = {}

  (0...map.length).each do |i|
    (0...map[i].length).each do |j|
      current = [i, j]
      peaks[[i, j]] = search_peak(map, current, peaks)
    end
  end
  peaks_count = peaks.values.uniq.map { |e| [e, peaks.values.count(e)] }.to_h
  peaks_count.values.minmax
end

def search_peak(map, current, peaks)
  neighbors = neighbors_of(map, current[0], current[1])

  maximum = neighbors.push(current).max_by do |element|
    map[element.first][element.last]
  end
  # memoization
  # if peaks[maximum] is present, then it is already calculated
  # no need to calculate it again
  return peaks[maximum] if peaks[maximum]
  return current if maximum == current

  search_peak(map, maximum, peaks)
end

# helper function
def neighbors_of(map, row, col)
  # returns all neighbors of an element
  dr = [-1, 1, 0, 0]
  dc = [0, 0, -1, 1]
  neighbors = []
  4.times do |i|
    new_row = row + dr[i]
    new_col = col + dc[i]

    next if new_row < 0 || new_col < 0
    next if new_row >= map.length || new_col >= map.length

    neighbors.push([new_row, new_col])
  end
  neighbors
end

p greatest_peaks(
  [
    [9, 8, 5],
    [5, 6, 3],
    [8, 4, 1]
  ]
)
# => [3, 6]

# p greatest_peaks(
#  [
#    [8, 12],
#    [9, 3]
#  ]
# )
# => [1, 3]
