# frozen_string_literal: true

class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

# helper function
def array_to_tree(array, index = 0)
  return nil if index >= array.length || array[index] == 0

  node = Node.new(array[index])
  node.left = array_to_tree(array, 2 * index + 1)
  node.right = array_to_tree(array, 2 * index + 2)

  node
end

# helper function
def height(node, max_height = 0, height = 1)
  if node.nil?
    max_height = height - 1 if max_height < height - 1
    return max_height
  end
  max_height = height(node.left, max_height, height + 1)
  max_height = height(node.right, max_height, height + 1)
  max_height
end

def balanced_tree?(array)
  root = array_to_tree(array)
  queue = []
  queue.push(root)

  until queue.empty?
    node = queue.shift
    p height(node.left), height(node.right)
    return false if (height(node.left) - height(node.right)).abs > 1

    queue.push(node.left) unless node.left.nil?

    queue.push(node.right) unless node.right.nil?
  end
  true
end

# puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
puts balanced_tree?([1, 2, 3, 0, 0, 4, 5, 0, 0, 0, 0, 6, 0, 7, 8])
# => false

# puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true
