# frozen_string_literal: true

require 'set'

inputs = File.read('4.input').split(/^$/)

numbers = inputs.shift.strip.split(',')

class Card
  attr_accessor :rows, :numbers, :won

  def initialize(raw_card)
    raw_rows = raw_card.strip.split("\n")
    self.rows = raw_rows.map(&:split)
    self.won = false
    self.numbers = []
  end

  def check(numbers)
    return false if self.won

    current = numbers.to_set
    columns = self.rows.transpose
    return unless self.rows.any? { |i| i.to_set <= current } || columns.any? { |i| i.to_set <= current }

    self.numbers = numbers
    self.won = true
  end

  def score
    return 0 unless self.won

    (self.rows.flatten - self.numbers).map(&:to_i).sum * self.numbers.last.to_i
  end
end

cards = inputs.map { |i| Card.new(i) }

round = 4
winners = []
loop do
  round += 1
  current = numbers.slice(0, round)
  break if round > numbers.count

  winners += cards.select { |i| i.check(current) }
end

last = winners.last
puts last.score
