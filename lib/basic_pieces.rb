class Piece
  attr_reader :position

  def initialize(position, board)
    @position, @board = position, board
  end

end

class Slide < Piece
  DIRECTIONS = [:up, :down, :left, :right, :up_left, :up_right, :down_left, :down_right]

  def initialize(position, board)
    super(position, board)
  end

  def move(direction, length)

  end

end

class King < Slide

end