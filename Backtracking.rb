def isValid(coins, array, k, val)
    return coins.count(val) > array.count(val) && array.inject(0, :+) + val <= k ? true : false
end


def exact_sum?(k, coins, position = 0, array = [0]*coins.length)
    if array.inject(0, :+) == k
        return true
    end

    coins.each_with_index do |val,index| 
        if isValid(coins, array, k, val)
            array[position] = val
            if(exact_sum?(k, coins, position + 1, array))
                return true
            end
            array[position]=0
        end
    end
    return false
end
  
  #puts exact_sum?(12, [1, 2, 3, 4, 5])
  # => true
  
  puts exact_sum?(11, [1, 5, 9, 13])
  # => false
  