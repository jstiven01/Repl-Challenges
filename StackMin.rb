#!/usr/bin/env ruby
# frozen_string_literal: true

class Stack
  attr_accessor :array, :min_index, :length

  def initialize
    @array = []
    @length = 0
    @min_index = nil
  end

  def push(number)
    # your code here
    @array << number
    @length += 1
    @min_index = @length - 1 if @min_index.nil? || @array[@min_index] > number
  end

  def pop
    # your code here
    number = @array[@length - 1]
    @array.delete_at(@length - 1)
    @length -= 1
    update_min if @length == @min_index
    number
  end

  def min
    # your code here
    @array[@min_index]
  end

  def update_min
    @min_index = nil
    @length.times do |i|
      @min_index = i if @min_index.nil? || @array[@min_index] > @array[i]
    end
  end
end

stack = Stack.new

stack.push(5)
puts stack.min
# => 5
stack.push(3)
puts stack.min
# => 3

stack.pop
puts stack.min
