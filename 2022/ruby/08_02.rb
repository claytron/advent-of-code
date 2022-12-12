# frozen_string_literal: true

rows = File.read("../08#{ARGV[0]}.input")
  .split("\n")
  # Turn into an array
  .map(&:chars)
  # Make sure everything is integers
  .map { |i| i.map(&:to_i) }

columns = rows.transpose

scenic_score = 0
views = Hash.new { |h, k| h[k] = [] }

# Look at each inner row
rows[1..-2].each_with_index do |row, idx|
  x = idx + 1
  # Now each of the inner elements
  row[1..-2].each_with_index do |pos, i_idx|
    y = i_idx + 1
    coord = "#{x}_#{y}"
    left = 1
    rows[x][0..y - 1].reverse.each_with_index do |l, l_idx|
      left = l_idx + 1
      break if pos <= l
    end
    right = 1
    rows[x][y + 1..].each_with_index do |r, r_idx|
      right = r_idx + 1
      break if pos <= r
    end
    views[coord].concat([left, right])
  end
end

# Look at each inner column
columns[1..-2].each_with_index do |column, idx|
  y = idx + 1
  # Now each of the inner elements
  column[1..-2].each_with_index do |pos, i_idx|
    x = i_idx + 1
    coord = "#{x}_#{y}"
    up = 1
    columns[y][0..x - 1].reverse.each_with_index do |u, u_idx|
      up = u_idx + 1
      break if pos <= u
    end
    down = 1
    columns[y][x + 1..].each_with_index do |d, d_idx|
      down = d_idx + 1
      break if pos <= d
    end
    views[coord].concat([up, down])
  end
end

puts views.values.map { |i| i.inject(:*) }.max
