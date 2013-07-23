require './basic_pieces.rb'
class Chess
  ## UI stuff

  def play
   @board = Board.new
   #make sure to downcase input
   # x = ('a'..'z').to_a.index(letter)
   # y = number
  end

end

class Board
  ## Making board array

  def initialize
    @chess_board = []
    generate_board
    #generate_pieces
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
    self[0, 0] = King.new([0,0], self)
    # TODO: Place pieces
  end

  def checkmate?

  end

  def []=(x, y, piece)
    @chess_board[y][x] = piece
  end

  def [](x, y)
    @chess_board[y][x]
  end

  def to_s
    # TODO: returns a string representation of the board
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  king = King.new([0,4], board)
  p king.position
  king.move(:up_left)
  p king.position
end