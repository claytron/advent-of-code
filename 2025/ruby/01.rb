# frozen_string_literal: true

inputs = File.read("../input/01#{ARGV[0]}.input").split("\n")

cur = 50
hits = 0

inputs.each do |i|
  dir = i[0]
  amt = i[1..].to_i

  if dir == 'L'
    cur -= amt
  elsif dir == 'R'
    cur += amt
  end

  cur %= 100
  hits += 1 if cur.zero?
end

puts hits
