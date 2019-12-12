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
      @head = if @head == @tail
                @tail = nil
              else
                @head.next_node
              end
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

  def is_empty
    @head.nil? ? true : false
  end
end
class Queue
  attr_accessor :lkdList

  def initialize
    @lkdList = LinkedList.new
  end

  def add(number)
    # your code here
    @lkdList.add(number)
  end

  def remove
    # your code here
    if !@lkdList.head.nil?
      number = @lkdList.get(0)
      @lkdList.remove(0)
      number
    else
      -1
    end
  end

  def is_empty
    @lkdList.is_empty
  end
end

def transpose(string)
  queue = Queue.new
  newstring = ''
  string.each_char do |char|
    if char == 'g'
      queue.add(char)
    elsif char == 'n'
      newstring += char
    elsif !queue.is_empty
      newstring += queue.remove until queue.is_empty
      newstring += char
    else
      newstring += char
    end
  end
  if queue.is_empty
    return newstring
  else
    newstring += queue.remove until queue.is_empty
    return newstring
  end
end

puts transpose('he was searchign on Bign for signign kigns')
# => he was searching on Bing for singing kings

puts transpose('rignadingdiggn!')
# => ringadingdingg!

puts transpose('gngngnnggnngggnnn')
# => nnnnnnnnngggggggg
