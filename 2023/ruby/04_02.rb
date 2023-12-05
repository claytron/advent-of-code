# frozen_string_literal: true

inputs = File.read("../input/04#{ARGV[0]}.input").split("\n")

winning_cards = Hash.new { [] }

inputs.each do |card|
  card_raw, numbers = card.split(':')
  card_num = card_raw.split[1].to_i
  winning, mine = numbers.split('|').map(&:split).map { |i| i.map(&:to_i) }

  winners = winning & mine
  winning_cards[card_num] = winning_cards[card_num].concat(Range.new(card_num + 1, card_num + winners.length).to_a)
end

def card_calc(total_cards, winning_cards, card_num, cards)
  Range.new(card_num + 1, card_num + cards.length).each do |i|
    total_cards = card_calc(total_cards, winning_cards, i, winning_cards[i])
    total_cards[i] += 1
  end
  total_cards
end

total_cards = Hash.new(0)
winning_cards.keys.sort!.each do |card_num|
  cards = winning_cards[card_num]
  # current card always gets one
  total_cards[card_num] += 1
  total_cards = card_calc(total_cards, winning_cards, card_num, cards)
end

puts total_cards.values.sum
