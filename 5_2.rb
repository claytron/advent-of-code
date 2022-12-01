# frozen_string_literal: true

inputs = File.read('5.input_short').split("\n").map do |i|
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
  if direction
    next
    points = i[direction].sort!
    Range.new(points[0], points[1]).each do |point|
      key = direction.zero? ? "#{point}.#{start}" : "#{start}.#{point}"
      coord[key] += 1
    end
  else
    # TODO: not doing this part right...
    xy = i.dup.transpose
    puts xy.inspect

    if xy[0][0] > xy[1][0]
      steps = xy[0][0] - xy[1][0]
      coord["#{xy[0][0]}.#{xy[0][1]}"] += 1
      steps.times do
        xy[0][0] += 1
        xy[0][1] += 1
        coord["#{xy[0][0]}.#{xy[0][1]}"] += 1
      end
    else
      steps = xy[1][0] - xy[0][1]
      coord["#{xy[1][0]}.#{xy[1][1]}"] += 1
      steps.times do
        xy[1][0] -= 1
        xy[1][1] -= 1
        coord["#{xy[1][0]}.#{xy[1][1]}"] += 1
      end
    end
  end
  break
end

puts coord
puts coord.values.select { |i| i > 1 }.count
