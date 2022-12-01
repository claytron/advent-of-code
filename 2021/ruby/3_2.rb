# frozen_string_literal: true

# get an array of each column
inputs = File.read('3.input').split("\n").map(&:chars)

def column_counts(columns, high: true)
  counts = columns.tally

  return high ? '1' : '0' if counts.values.uniq.one?

  if high
    counts.key(counts.values.max)
  else
    counts.key(counts.values.min)
  end
end

def details(inputs, high: true, idx: 0)
  columns = inputs.transpose
  to_find = column_counts(columns[idx], high: high)

  new_inputs = inputs.select { |i| i[idx] == to_find }

  return new_inputs.first.join.to_i(2) if new_inputs.count == 1

  details(new_inputs, high: high, idx: idx + 1)
end

oxy = details(inputs)
co2 = details(inputs, high: false)

puts oxy * co2
