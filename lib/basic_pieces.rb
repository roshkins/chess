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
    raise RuntimeError.new("not a valid direction") unless DIRECTIONS.include?(direction)
    self.send(direction)
  end

  private
  def up_left(length)
    @position.first -= length
    @position.last  += length
  end

  def up(length)
    @position.last  += length
  end

  def up_right(length)
    @position.first += length
    @position.last  += length
  end

  def right(length)
    @position.first += length
  end

  def down_right(length)
    @position.first += length
    @position.last  -= length
  end

  def down(length)
    @position.first -= length
  end

  def down_left(length)
    @position.first -= length
    @position.last  -= length
  end

  def left(length)
    @position.first -= length
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