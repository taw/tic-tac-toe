class HumanPlayer < Player
  def next_play(board)
    puts "Please place your next #{@symbol}\n"
    while true
      name = gets.chomp
      if !board.fields.include?(name)
        puts "#{name} is not valid. Please place your next #{@symbol}\n"
      elsif !board.empty_fields.include?(name)
        puts "#{name} is not empty. Please place your next #{@symbol}\n"
      else
        return name
      end
    end
  end
end
