# frozen_string_literal: true

require 'set'

inputs = File.read('4.input').split(/^$/)

numbers = inputs.shift.strip.split(',')

class Card
  attr_accessor :rows

  def initialize(raw_card)
    raw_rows = raw_card.strip.split("\n")
    self.rows = raw_rows.map(&:split)
  end

  def check(numbers)
    current = numbers.to_set
    columns = self.rows.transpose
    self.rows.any? { |i| i.to_set <= current } || columns.any? { |i| i.to_set <= current }
  end

  def score(numbers)
    return 0 unless self.check(numbers)

    (self.rows.flatten - numbers).map(&:to_i).sum
  end
end

cards = inputs.map { |i| Card.new(i) }

round = 4
winners = []
loop do
  round += 1
  current = numbers.slice(0, round)
  break if round > numbers.count

  winners = cards.select { |i| i.check(current) }
  break unless winners.empty?
end

final_numbers = numbers.slice(0, round)
puts winners.first.score(final_numbers) * final_numbers.last.to_i
