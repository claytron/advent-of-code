# frozen_string_literal: true

inputs = File.read('1.input').split.map(&:to_i)

changes = inputs.each_with_object({ count: 0, previous: nil }) do |i, stats|
  previous = stats[:previous]
  stats[:count] += 1 if !previous.nil? && previous < i
  stats[:previous] = i
end

puts changes[:count]
