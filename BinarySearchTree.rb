class Node
    attr_reader :data
    attr_accessor :left, :right
  
    def initialize(data)
      @data = data
    end
end
  
class BST
    attr_accessor  :root, :nodecount
    def initialize
        @nodecount = 0
    end

    def insert(new_node)
        @root = inserthelp(@root, new_node)
        @nodecount += 1
    end

    def inserthelp(rt, new_node)
        if rt.nil?
            return new_node
        end
        if rt.data > new_node.data 
            rt.left = inserthelp(rt.left, new_node)
        else
            rt.right = inserthelp(rt.right, new_node)
        end
        return rt
    end
  
    def pre_order(node = @root)
      #implementation from the previous challenge
      if node == nil
        return ''
      end
    
      result = "#{node.data} "
      result += pre_order(node.left)
      result += pre_order(node.right)
    end
  end
  
  
  def binary_search_tree(array)
    tree = BST.new
    array.each { |e| tree.insert(Node.new(e)) }
    tree.pre_order
  end
  
  puts binary_search_tree([8, 3, 10, 1, 6, 14, 4, 7, 13])
  # => "8 3 1 6 4 7 10 14 13"