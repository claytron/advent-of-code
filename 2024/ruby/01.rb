# frozen_string_literal: true

inputs = File.read("../input/01#{ARGV[0]}.input").split("\n")

pairs = inputs.map(&:split).map { |i| i.map(&:to_i) }

column_one = pairs.map { |i| i[0] }.sort
column_two = pairs.map { |i| i[1] }.sort

sorted_pairs = column_one.zip(column_two)

puts sorted_pairs.map { |x, y| (x - y).abs }.sum
