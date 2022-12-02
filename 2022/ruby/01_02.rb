# frozen_string_literal: true

totals = File.read('../01.input').split("\n\n").map do |i|
  i.split.map(&:to_i)
end.map(&:sum)

totals.sort!.reverse!
puts totals[0..2].sum
