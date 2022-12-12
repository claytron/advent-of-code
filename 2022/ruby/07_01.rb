# frozen_string_literal: true

inputs = File.read("../07#{ARGV[0]}.input").split("\n")

curdir = []

class Dir
  attr_accessor :path, :children, :items

  def initialize(path, children: nil, items: nil)
    self.path = path
    self.children = children || []
    self.items = items || []
  end

  def to_s
    path
  end

  def contains(dir)
    dir.path.start_with?(path)
  end

  def size
    items.reject { |i| i[0] == 'dir' }.collect { |i| i[0] }.map(&:to_i).sum
  end

  def total_size
    total = size
    total + children.each.map(&:total_size).sum
  end

  def find_size_under(size = 0)
    dirs = []

    children.each do |child|
      dirs.append(child) if child.total_size <= size && dirs.none? { |dir| dir.contains(child) }
      dirs.concat(child.find_size_under(size))
    end

    dirs
  end

  def find(find_path)
    return self if find_path == path

    found = children.select { |child| child.path == find_path }.first
    return found if found

    children.each do |child|
      found = child.find(find_path)
      return found if found
    end

    nil
  end

  def add(new_path)
    exists = find(new_path)
    return exists if exists

    parent_path = new_path.split('/')[0..-2].join('/')
    parent_path = parent_path.empty? ? '/' : parent_path
    parent = parent_path == path ? self : find(parent_path)

    new = Dir.new(new_path)
    parent.children.append(new)

    new
  end
end

root = Dir.new('/')

inputs.each do |line|
  case line
    when /^\$/
      args = line.split
      # get rid of the prompt
      args.shift

      next if args[0] == 'ls'

      case args[1]
        when '/' then next
        when '..' then curdir.pop
        else
          curdir.append(args[1])
          path = "/#{curdir.join('/')}"
          root.add(path)
      end
    else
      path = "/#{curdir.join('/')}"
      dir = root.find(path)
      dir.items.append(line.split)
  end
end

puts root.find_size_under(100_000).map(&:total_size).sum
