# frozen_string_literal: true

inputs = File.read('1.input').split.map(&:to_i)

changes = inputs.each_cons(3).each_with_object({ count: 0, previous: nil }) do |i, stats|
  next unless i.count == 3

  # initialize the previous set
  if stats[:previous].nil?
    stats[:previous] = i
    next
  end

  stats[:count] += 1 if stats[:previous].sum < i.sum
  stats[:previous] = i
end

puts changes[:count]
