# frozen_string_literal: true

inputs = File.read("../input/04#{ARGV[0]}.input").split("\n")

points = 0
inputs.each do |card|
  _, numbers = card.split(':')
  winning, mine = numbers.split('|').map(&:split).map { |i| i.map(&:to_i) }
  winners = (winning & mine).length
  next if winners.zero?

  next points += 1 if winners == 1

  value = (winners - 1).times.inject(1) { |i| i * 2 }
  points += value
end

puts points
