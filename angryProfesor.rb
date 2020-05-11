def angryProfessor(k, a)
    k <= a.select{ |time| time <= 0}.length ? 'NO' : 'YES'
end

p angryProfessor(3, [-1, -3, 4, 2])