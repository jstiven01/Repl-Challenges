# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
  end

class LinkedList
  # setup head and tail
  attr_accessor :head, :tail

  def add(number)
    # your code here
    newNode = Node.new(number)
    if @tail.nil?
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
    p = head

    while !p.nil? && i < index
      p = p.next_node
      i += 1
    end

    p.value
  end

  def get_node(index)
    i = 0
    node = head

    while !node.nil? && i < index
      node = node.next_node
      i += 1
    end

    node
  end

  def add_at(index, item)
    if index == 0 # Changing the head
      newNode = Node.new(item, @head)
      @head = newNode
    else
      nodeBefore = get_node(index - 1)
      newNode = Node.new(item, nodeBefore.next_node)
      nodeBefore.next_node = newNode
      @tail = newNode if @tail == nodeBefore
    end
  end

  def remove(index)
    return puts 'Error, Empty List' if @head.nil?

    if index == 0 # Removing the head
      @head = @head.next_node
    else
      nodeBefore = get_node(index - 1)
      if @tail == nodeBefore.next_node
        nodeBefore.next_node = nil
        @tail = nodeBefore
      else
        nodeBefore.next_node = nodeBefore.next_node.next_node
      end
    end
  end
end

class Stack
  attr_accessor :lkdList

  def initialize
    @lkdList = LinkedList.new
  end

  def push(number)
    # your code here
    @lkdList.add_at(0, number)
  end

  def pop
    # your code here
    numberTop = @lkdList.get(0)
    @lkdList.remove(0)
    numberTop
  end
  end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.pop
# => 5

stack.push(2)
stack.push(7)
puts stack.pop
# => 7

puts stack.pop
# => 2

puts stack.pop
# => 3
