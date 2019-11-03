class Node
	attr_reader :data
  attr_accessor :left, :right
  
  def initialize data
    @data = data
  end
end

# helper function
def array_to_tree(array, index = 0)
  return nil if index >= array.length || array[index] == 0

  node = Node.new(array[index])
  node.left = array_to_tree(array, 2*index+1)
  node.right = array_to_tree(array, 2*index+2)

  node
end

# helper function
def height(node, max_height = 0, height = 1)
    if node.nil?
        if max_height < height - 1 then max_height = height - 1 end
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

  while !queue.empty?
    node = queue.shift
    p height(node.left) , height(node.right)
    if (height(node.left) - height(node.right)).abs > 1
        return false
    end
    if !node.left.nil? then queue.push(node.left) end

    if !node.right.nil? then queue.push(node.right) end
  end
  return true
end

#puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
puts balanced_tree?([1, 2, 3, 0, 0, 4, 5, 0, 0, 0, 0, 6, 0, 7, 8])
# => false

#puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true