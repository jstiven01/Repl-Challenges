def reverse_number(number)
    reverse_num = 0
    while number > 0
        remainder = number % 10
        reverse_num = (reverse_num * 10) + remainder
        number = (number / 10).to_i
    end
    reverse_num
end

def beautiful_days(i, j, k)
    beautiful_days_counter = 0
    (i..j).each do |number|
        if (number - reverse_number(number)).abs % k == 0
            beautiful_days_counter += 1
        end
    end
    beautiful_days_counter
end

p beautiful_days(13, 45 , 3)