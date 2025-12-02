# frozen_string_literal: true

inputs = File.read("../input/02#{ARGV[0]}.input").split("\n")
rows = inputs.map(&:split).map { |i| i.map(&:to_i) }

safe = 0

def check_safe(row)
  direction = nil

  row.each_with_index do |i, idx|
    next if idx.zero?

    last = row.count == idx + 1
    prev = row[idx - 1]

    result = prev - i

    return if result.zero? || result.abs > 3

    cur_direction = result.positive? ? :asc : :desc
    direction = cur_direction if direction.nil?

    same_direction = direction == cur_direction

    return true if last && same_direction

    return unless same_direction
  end
end

rows.each do |row|
  if check_safe(row)
    safe += 1
    next
  end

  (0..row.count).each do |idx|
    row_copy = row.dup
    row_copy.delete_at(idx)

    if check_safe(row_copy)
      safe += 1
      break
    end
  end
end

puts safe
