# frozen_string_literal: true

inputs = File.read('../05.input').split("\n\n")

# This is a bit gnarly, but it gets rid of the brackets and preserves the stacks
stacks_raw = inputs[0].gsub(/[\[\]]/, '').gsub('    ', '.').gsub(' ', '').split("\n")
# get rid of the row with stack numbers
stacks_raw.pop

# Get the columns and transpose to have an array per stack
stacks = stacks_raw.map(&:chars).transpose.map(&:reverse!).map do |stack|
  Kernel.loop do
    break unless stack.index('.')

    # get rid of the placeholder dots in the structure
    stack.pop
  end
  stack
end

# Get the list of moves from the text
moves = inputs[1].split("\n").map do |move|
  move.sub('move ', '').sub(' from ', ',').sub(' to ', ',').split(',').map(&:to_i)
end

moves.each do |move|
  count, from, to = move
  from -= 1
  to -= 1

  stacks[to].concat(stacks[from].slice!(-count..-1))
end

puts stacks.map(&:last).join
