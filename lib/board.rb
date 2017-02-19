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
