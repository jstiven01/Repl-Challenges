# frozen_string_literal: true

def graph_cycle?(graph, is_cycle = false, queue = [], array = [], next_node = 0)
  return false if next_node.nil?

  unless array.include? next_node
    array.push(next_node)
    if (array & graph[next_node]).length > 1
      queue = []
      return true
    else
      graph[next_node].each { |x| queue.push(x) }
    end
  end

  is_cycle = graph_cycle?(graph, is_cycle, queue, array, queue.shift)
  is_cycle
end

puts graph_cycle?(
  0 => [2],
  1 => [2],
  2 => [0, 1, 3, 4, 5],
  3 => [2],
  4 => [2],
  5 => [2]
)
# => false

puts graph_cycle?(
  0 => [2],
  1 => [4],
  2 => [0, 5, 3],
  3 => [5, 2],
  4 => [5, 1],
  5 => [4, 2, 3]
)
# => true
