# frozen_string_literal: true

inputs = File.read('../05.input').split("\n\n")

# Extract the data from the stack blob
stacks_raw = inputs[0].split("\n").map do |row|
  row.chars.each_slice(4).map do |container|
    id = container[1]
    id.strip.empty? ? nil : id
  end
end
# get rid of the row with stack numbers
stacks_raw.pop

# Transpose to have an array per stack and set the correct order and clean out empties
stacks = stacks_raw.transpose.map(&:reverse!).map(&:compact)

# Get the list of moves from the text
moves = inputs[1].split("\n").map do |move|
  move.scan(/\d+/).map(&:to_i)
end

moves.each do |move|
  count, from, to = move
  from -= 1
  to -= 1

  stacks[to].concat(stacks[from].slice!(-count..-1))
end

puts stacks.map(&:last).join
