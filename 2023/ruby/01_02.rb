# frozen_string_literal: true

inputs = File.read("../input/01#{ARGV[0]}.input").split("\n")

num_name = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9',
}

result = inputs.each.map do |input|
  input.scan(/(?=(#{num_name.keys.join("|")}))/).flatten.each do |digit|
    input.gsub!(digit, "#{num_name[digit]}#{digit}")
  end
  input.scan(/\d/).values_at(0, -1).join.to_i
end

puts result.sum
