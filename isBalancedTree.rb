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
def height(node)
	# use your function from the previous challenge
end

def balanced_tree?(array)
  root = array_to_tree(array)
	# write your code here
end

puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true