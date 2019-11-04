def bfs(graph, queue = [], array = [], next_node = 0)
    if next_node.nil?
        return 
    end
    if !array.include? next_node
        array.push(next_node)
        graph[next_node].each{ |x| queue.push(x)}
    end

    bfs(graph, queue, array, queue.shift)
    array
end

def connected_graph?(graph)
    if graph.length == bfs(graph).length
      return true
    else
      return false
    end
end
  
puts connected_graph?({
  0 => [2], 
  1 => [4], 
  2 => [0, 5, 3], 
  3 => [5, 2], 
  4 => [5, 1], 
  5 => [4, 2, 3]
  })
  # => true

puts connected_graph?({
  0 => [1, 2], 
  1 => [0, 2], 
  2 => [0, 1, 3, 4, 5], 
  3 => [2, 4], 
  4 => [3, 2], 
  5 => [2]
  })
  # => true