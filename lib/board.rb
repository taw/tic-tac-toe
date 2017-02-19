class Board
  def initialize(contents={})
    @contents = {}
    contents.each do |name, value|
      raise "No such field: #{name}" unless fields.include?(name)
      raise "Already set field name: #{name}" if @contents.has_key?(name)
      @contents[name] = value
    end
  end

  def fields
    ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  end

  def contents
    @contents.dup
  end

  def winning_lines
    [
      # columns
      ["A1", "A2", "A3"],
      ["B1", "B2", "B3"],
      ["C1", "C2", "C3"],
      # rows
      ["A1", "B1", "C1"],
      ["A2", "B2", "C2"],
      ["A3", "B3", "C3"],
      # diagonals
      ["A1", "B2", "C3"],
      ["A3", "B2", "C1"],
    ]
  end

  def has_winning_line?(value)
    winning_lines.any? do |line|
      line.all?{|name| self[name] == value}
    end
  end

  def [](name)
    raise "No such field: #{name}" unless fields.include?(name)
    @contents[name]
  end

  def empty_fields
    fields.select do |name|
      not @contents.has_key?(name)
    end
  end

  def play(name, value)
    raise "No such field: #{name}" unless fields.include?(name)
    raise "Already filled: #{name}" if @contents.has_key?(name)
    Board.new(@contents.merge(name => value))
  end
end
