# frozen_string_literal: true

inputs = File.read("../input/01#{ARGV[0]}.input").split("\n")

pairs = inputs.map(&:split).map { |i| i.map(&:to_i) }

column_one = pairs.map { |i| i[0] }
column_two = pairs.map { |i| i[1] }

column_one.map! do |i|
  i * column_two.select { |j| i == j }.count
end

puts column_one.sum
