class Piece
  attr_reader :position

  def initialize(position, board)
    @position, @board = position, board
  end
  def position=(x,y)
    @board[x, y] = self
    @position = [x, y]
  end

  def x
    @position.first
  end

  def y
    @position.last
  end

end

class Slide < Piece
  DIRECTIONS = [:up_left, :up, :up_right,  :right, :down_right, :down, :down_left, :left ]

  def initialize(position, board)
    super(position, board)
  end

  def move(direction, length)
    raise RuntimeError.new("not a valid direction") unless DIRECTIONS.include?(direction)
    self.send(direction, length)
  end

  private
  def up_left(length)
    @position[0] -= length
    @position[1]  += length
  end

  def up(length)
    @position[1]   += length
  end

  def up_right(length)
    @position[0] += length
    @position[1]   += length
  end

  def right(length)
    @position[0] += length
  end

  def down_right(length)
    @position[0] += length
    @position[1]   -= length
  end

  def down(length)
    @position[0] -= length
  end

  def down_left(length)
    @position[0] -= length
    @position[1]   -= length
  end

  def left(length)
    @position[0] -= length
  end
end

class King < Slide
  def initialize(position, board)
    super(position, board)
  end

  def move(direction)
    super(direction, 1)
  end
end