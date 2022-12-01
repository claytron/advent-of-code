# frozen_string_literal: true

inputs = File.read('2.input').split("\n").map do |i|
  item = i.split
  [item[0], item[1].to_i]
end

position = inputs.each_with_object({ h: 0, d: 0, aim: 0 }) do |i, pos|
  move = i[0]
  amount = i[1]

  case move
    when 'down' then pos[:aim] += amount
    when 'up' then pos[:aim] -= amount
    when 'forward'
      pos[:h] += amount
      pos[:d] += pos[:aim] * amount
  end
end

puts position[:h] * position[:d]
