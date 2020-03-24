# frozen_string_literal: true

def almost_palindromes(str)
  length = str.length
  a = 0
  b = length - 1
  total = 0

  while a < length
    if str[a] != str[b]
      total += 1
      return false if total > 2
    end
    a += 1
    b -= 1
  end

  true
end

a = 'abccba'
b = 'abccbx'
c = 'abccfg'

p almost_palindromes(a), almost_palindromes(b), almost_palindromes(c)
