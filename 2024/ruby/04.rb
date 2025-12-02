# frozen_string_literal: true

class CheerFinder
  def initialize(phrase, inputs)
    @phrase = phrase
    @inputs = inputs
    @coord_map = phrase.chars.to_h { |letter| [letter, coords(letter)] }
  end

  def coords(letter)
    @inputs.collect do |line|
      line.each_with_index.select { |i, _| i == letter }.map(&:last)
    end
  end

  # I hate this...
  def check(coord, idx)
    second_char = @phrase[1]
    second = @coord_map[second_char]
    e = second[idx].include?(coord + 1)
    w = second[idx].include?(coord - 1)
    if idx.positive?
      n = second[idx - 1].include?(coord)
      ne = second[idx - 1].include?(coord + 1)
      nw = second[idx - 1].include?(coord - 1)
    end
    if idx + 1 < second.count
      s = second[idx + 1].include?(coord)
      se = second[idx + 1].include?(coord + 1)
      sw = second[idx + 1].include?(coord - 1)
    end
    [coord, n, ne, e, se, s, sw, w, nw]
  end

  def find_starts
    @coord_map[@phrase.chars.first].each_with_index do |start_coords, idx|
      start_coords.each do |start_coord|
        puts check(start_coord, idx)
      end
    end
  end
end

inputs = File.read("../input/04#{ARGV[0]}.input").split("\n").map(&:chars)
phrase = 'XMAS'
finder = CheerFinder.new(phrase, inputs)
finder.find_starts
