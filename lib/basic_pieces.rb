class Piece
  attr_reader :position

  def initialize(position, board)
    @position, @board = position, board
  end

end

class Slide < Piece
  DIRECTIONS = [:up_left, :up, :up_right,  :right, :down_right, :down, :down_left, :left ]

  def initialize(position, board)
    super(position, board)
  end

  def move(direction, length)
    self.send(direction)
  end

  private
  def up_left(length)


  end
end

class King < Slide

end