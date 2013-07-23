class Chess
  ## UI stuff

  def play
   @board = Board.new
   #make sure to downcase input
  end

end

class Board
  ## Making board array

  def initialize
    @chess_board = []
    generate_board
    generate_pieces
  end

  def generate_board
    8.times do |row|
      row_board = []
      8.times do |col|
        row_board << nil
      end
      @chess_board << row_board
    end
  end

  def generate_pieces
    # TODO: Place pieces
  end

  def checkmate?

  end

  def [](x, y)
    @chess_board[y][x]
  end

  def to_s
    # TODO: returns a string representation of the board
  end

end