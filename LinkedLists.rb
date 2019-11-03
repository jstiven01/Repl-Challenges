class Node
    attr_accessor :value, :next_node
    
    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end
  
class LinkedList
#setup head and tail
    attr_accessor :head, :tail

    def add(number)
        # your code here
        newNode = Node.new(number)
        if @tail == nil
            @head = newNode
            @tail = newNode
        else
            @tail.next_node = newNode
            @tail = newNode
        end
    end

    def get(index)
        # your code here
        i = 0
        p = @head

        while p != nil && i < index
            p = p.next_node
            i += 1
        end

        return p.value
    end

    def get_node(index)
        i = 0
        node = head

        while node != nil && i < index
            node = node.next_node
            i += 1
        end

        return node
    end

    def add_at(index, item)
        if index == 0 #Changing the head
            newNode = Node.new(item, @head)
            @head = newNode
        else
            nodeBefore = get_node(index-1)
            newNode = Node.new(item, nodeBefore.next_node)
            nodeBefore.next_node = newNode
            if @tail == nodeBefore
                @tail = newNode
            end 
        end     
    end

    def remove(index)
        if @head == nil
            return puts "Error, Empty List"
        end

        if index == 0 #Removing the head
            @head = @head.next_node
        else
            nodeBefore = get_node(index-1)
            if @tail == nodeBefore.next_node
                nodeBefore.next_node = nil
                @tail = nodeBefore
            else
                nodeBefore.next_node = nodeBefore.next_node.next_node
            end             
        end  
    end 

end

list = LinkedList.new

list.add(3)
list.add(5)
list.add(6)
list.add(8)
list.add(10)
list.add_at(1, 11)
list.add_at(0, 13)
list.remove(0)

puts list.get(2)
puts list.get(3)
  