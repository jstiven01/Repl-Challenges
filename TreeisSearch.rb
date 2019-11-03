class Node
    attr_reader :data
    attr_accessor :left, :right
  
    def initialize(data)
      @data = data
    end
  end
  
  def array_to_tree(array, i = 0)
    return nil if i >= array.length || array[i] == 0
  
    node = Node.new(array[i])
    node.left = array_to_tree(array, 2*i+1)
    node.right = array_to_tree(array, 2*i+2)
  
    node
  end
  
  def pre_order(node)
    if node == nil
      return ''
    end
  
    result = "#{node.data} "
    result += pre_order(node.left)
    result += pre_order(node.right)
  end
  
  def post_order(node, result = '')
    if node == nil
       return ''
    end
  
    result += post_order(node.left)
    result += post_order(node.right)
    result += "#{node.data} "
  end

  def inorder(node, result = '')
    if node.nil?
      return ''
    end

    result += inorder(node.left)
    result += "#{node.data} "
    result += inorder(node.right)
  end

  def search_tree?(array)
    root = array_to_tree(array)
    # write your code here
    return inorder(root).split(" ").map { |s| s.to_i } == array.select { |s| s != 0 }.sort ? true : false
  end
  puts search_tree?([21, 11, 26, 5, 14, 23, 30, 2, 8, 13, 16, 0, 0, 0, 0])
#  puts search_tree?([10, 4, 12])
  # => true
  #search_tree?([10, 5, 7])
  #puts search_tree?([10, 5, 7])
  # => false
  #p [10, 5, 7] == [10, 4545454, 7]