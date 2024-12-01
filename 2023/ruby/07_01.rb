# frozen_string_literal: true

inputs = File.read("../input/07#{ARGV[0]}.input").split("\n").map(&:split)

rank = {
  'A' => 14,
  'K' => 13,
  'Q' => 12,
  'J' => 11,
  'T' => 10,
}

hands = inputs.map do |input|
  hand, bet = input
  cards = hand.chars.map do |char|
    rank.keys.include?(char) ? rank[char] : char
  end.map(&:to_i).sort.reverse!
  sets = cards.chunk_while { |i, j| i == j }
  [sets, bet]
end
hands.sort! do |a, b|
  a_arr = a[0].to_a
  b_arr = b[0].to_a
  a_len = a_arr.length
  b_len = b_arr.length
  require 'debug'; binding.break
  a_len <=> b_len
end
