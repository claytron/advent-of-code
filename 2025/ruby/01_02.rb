# frozen_string_literal: true

inputs = File.read("../input/01#{ARGV[0]}.input").split("\n")

cur = 50
hits = 0

inputs.each do |i|
  dir = i[0]
  amt = i[1..].to_i

  if dir == 'R'
    hits += (cur + amt).div(100)
    cur = (cur + amt) % 100
  elsif dir == 'L'
    if cur.zero?
      hits += amt.div(100)
    elsif amt >= cur
      hits += 1 + (amt - cur).div(100)
    end
    cur = (cur - amt) % 100
  end
end

puts hits
