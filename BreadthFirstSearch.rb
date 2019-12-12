# frozen_string_literal: true

def bfs(graph, queue = [], array = [], next_node = 0)
  return if next_node.nil?

  unless array.include? next_node
    array.push(next_node)
    graph[next_node].each { |x| queue.push(x) }
  end

  bfs(graph, queue, array, queue.shift)
  array
end

p bfs(
  0 => [2],
  1 => [4],
  2 => [5, 0, 3],
  3 => [2],
  4 => [1, 5],
  5 => [4, 2]
)
