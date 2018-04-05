class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], [3,4,5],[6,7,8],[0,3,6],
  [1,4,7],[2,5,8],[0,4,8],[2,4,6]
  ]
  def initialize(board = nil) 
    @b = board || Array.new(9, " ")
  end
  
  # GENERAL METHODS ############
  
  def display_board
    puts [0,3,6].map {|i| " #{@b[i]} | #{@b[i+1]} | #{@b[i+2]} \n"}.join("#{'-'*11}\n")
  end
  
  # MAIN FUNCTION METHODS #########
  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
  
  def turn
    puts "Please enter 1-9:"
    self.gets_input
    self.input_to_index
    if self.valid_move?
      self.current_player 
      self.move 
      self.display_board
    else 
      self.turn
    end
  end
  
  # ENDGAME METHODS #########
  def over?
    return draw? || won?
  end
  
  def won? # b short for board
    WIN_COMBINATIONS.find do |win|
      @b[win[0]] == @b[win[1]] &&
      @b[win[1]] == @b[win[2]] && 
      @b[win[0]] != " "
    end
  end
  
  def draw?
    return full? && !won?
  end
  
  def full?
    return @b.none? {|square| square == " "}
  end
  
  def winner #return the piece of the winner 
    return @b[won?[0]] if won? # won returns the winning combo 
  end
  # END OF ENDGAME METHODS ########################################
  
  # SETUP MOVE METHODS #############################################
  def get_input
    @input = gets.strip
  end

  def input_to_index
    @index = @input.to_i - 1
  end


  # MOVE CHECK METHODS ########
  def valid_move?
    return !position_taken? && index.between?(0,8)
  end

  def position_taken?
    !(@b[index].nil? || @b[index] == " ")
  end


# ACTUAL MOVE METHODS #######
  
  def current_player
    @player_piece = turn_count.even? ? "X" : "O"
  end

  def turn_count
    return @b.count {|square| square != " "}
  end

  def move
    @b[@index] = @player_piece
  end



  
  
  
  


# NEW METHOD END ########################################

# CHECK GAME STATUS ####################################



# END CHECK GAME STATUS ####################################



