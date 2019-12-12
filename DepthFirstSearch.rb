# frozen_string_literal: true

def depth_first_search(graph, array = [], next_node = 0)
  if !array.include? next_node
    array.push(next_node)
    graph[next_node].each { |next_nd| depth_first_search(graph, array, next_nd) }
  else
    return
  end
  array
end

p depth_first_search(
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
)
