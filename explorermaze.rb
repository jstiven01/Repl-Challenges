# frozen_string_literal: true

def maze_escape(maze)
  visited = {}
  start = [0, 0]
  goal = find_goal(maze, 9)
  queue = [[start, [start]]]
  bfs(maze, queue, visited, goal)
end

def bfs(maze, queue, visited, goal)
  return if queue.empty?

  current, path = queue.shift
  visited[current] = true
  return to_cartesian(path) if current == goal

  neighbors = neighbors_of(maze, current[0], current[1])
  neighbors.each do |neighbor|
    queue.push([neighbor, path + [neighbor]]) unless visited[neighbor]
  end
  bfs(maze, queue, visited, goal)
end

# helper function
def neighbors_of(grid, row, col)
  # returns all neighbors of an element
  dr = [-1, 1, 0, 0]
  dc = [0, 0, -1, 1]
  neighbors = []
  4.times do |i|
    new_row = row + dr[i]
    new_col = col + dc[i]

    next if new_row.negative? || new_col.negative?
    next if new_row >= grid.length || new_col >= grid.length
    next if grid[new_row][new_col] == 1

    neighbors.push([new_row, new_col])
  end
  neighbors
end

# helper function
def find_goal(maze, target)
  maze.length.times do |i|
    maze[i].length.times do |j|
      return [i, j] if maze[i][j] == target
    end
  end
end

# helper function that returns given path in cartesian format
def to_cartesian(path)
  path.map(&:reverse)
end

p maze_escape(
  [
    [0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 1, 0, 1, 1],
    [0, 1, 0, 0, 0],
    [0, 0, 0, 1, 9]
  ]
)

# => [
#      [0, 0],
#      [1, 0],
#      [2, 0],
#      [2, 1],
#      [2, 2],
#      [2, 3],
#      [3, 3],
#      [4, 3],
#      [4, 4]
#
