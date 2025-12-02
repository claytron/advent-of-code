# frozen_string_literal: true

inputs = File.read("../input/02#{ARGV[0]}.input").split("\n")
rows = inputs.map(&:split).map { |i| i.map(&:to_i) }

safe = 0

rows.each do |row|
  direction = nil

  row.each_with_index do |i, idx|
    next if idx.zero?

    last = row.count == idx + 1
    prev = row[idx - 1]

    result = prev - i

    break if result.zero? || result.abs > 3

    cur_direction = result.positive? ? :asc : :desc
    direction = cur_direction if direction.nil?

    same_direction = direction == cur_direction

    if last && same_direction
      safe += 1
      break
    end

    break unless same_direction
  end
end

puts safe
