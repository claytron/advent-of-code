# frozen_string_literal: true

inputs = File.read("../input/03#{ARGV[0]}.input").split("\n")
rows = inputs.map(&:chars).map { |i| i.map(&:to_i) }

def joltage?(row, limit)
  max = row[..limit].max
  idx = row.index(max)
  [idx, max]
end

joltages = []
rows.each do |row|
  joltage = []
  cur_limit = -12
  while joltage.count < 12
    # first pass, limit is -12, since that's the smallest dataset to find the largest number
    # Then depending on index, determine the next limit
    res = joltage? row, cur_limit
    puts "#{res}"
    joltage << res[1]
    row = row.dup[res[0] + 1..]
    puts "#{row}"
    if joltage.count > 9
      cur_limit = -1
    else
      cur_limit = -(12 - row.count)
    end
  end
  joltages << joltage.join.to_i
end

puts joltages
puts joltages.sum
