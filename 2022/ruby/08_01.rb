# frozen_string_literal: true

rows = File.read("../08#{ARGV[0]}.input")
  .split("\n")
  # Turn into an array
  .map(&:chars)
  # Make sure everything is integers
  .map { |i| i.map(&:to_i) }

columns = rows.transpose

visible = 0
COORD_VISIBLE = [] # rubocop:disable Style/MutableConstant

# Visibility of the perimeter
visible += (rows[0].length * 2) - 2
visible += (columns[0].length * 2) - 2

def visible?(idx, pos, array, coord)
  visibility = [
    array[0..idx - 1].max < pos,
    array[idx + 1..].max < pos,
  ].any?
  COORD_VISIBLE << coord if visibility
end

# Look at each inner row
rows[1..-2].each_with_index do |row, idx|
  x = idx + 1
  # Now each of the inner elements
  row[1..-2].each_with_index do |pos, i_idx|
    y = i_idx + 1
    coord = "#{x}_#{y}"
    # Check visibility
    visible += 1 if visible?(y, pos, rows[x], coord)
  end
end

# Look at each inner column
columns[1..-2].each_with_index do |column, idx|
  y = idx + 1
  # Now each of the inner elements
  column[1..-2].each_with_index do |pos, i_idx|
    x = i_idx + 1
    coord = "#{x}_#{y}"
    # If it was already noted as visible, we can skip
    next if COORD_VISIBLE.include?(coord)

    visible += 1 if visible?(x, pos, columns[y], coord)
  end
end

puts visible
