def distance (x1, y1, x2, y2)
 Math.sqrt(((x2-x1)** 2)+(y2-y1)**2)
end

x1 = 2
x2 = 4
x3 = 6
y1 = 0
y2 = 5
y3 = 9
distance_p1_p2 = distance(x1, y1, x2, y2)
distance_p1_p3 = distance(x1, y1, x3, y3)
distance_p2_p3 = distance(x2, y2, x3, y3)

average_distance = (distance_p1_p2 + distance_p1_p3+ distance_p2_p3)

p "Average distance among 3 points is #{average_distance}"