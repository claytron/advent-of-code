# frozen_string_literal: true

inputs = File.read('5.input').split("\n").map do |i|
  i.split('->').map(&:strip).map { |n| n.split(',').map(&:to_i) }.transpose
end

def plot(directions)
  if directions[0].uniq.one?
    [1, directions[0][0]]
  elsif directions[1].uniq.one?
    [0, directions[1][1]]
  end
end

coord = Hash.new(0)
inputs.each do |i|
  direction, start = plot(i)
  next unless direction

  points = i[direction].sort!
  Range.new(points[0], points[1]).each do |point|
    key = direction.zero? ? "#{point}.#{start}" : "#{start}.#{point}"
    coord[key] += 1
  end
end

puts coord.values.select { |i| i > 1 }.count
