# coding: utf-8
class Piece
  attr_reader :position

  def initialize(position, board, color)
    @position, @board, @color = position, board, color
  end
  def position_relative=(rel)
    @board[@position.first, @position.last] = nil
    x = @position.first + rel.first
    y = @position.last  + rel.last
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

  def initialize(position, board, color)
    super(position, board, color)
  end

  def move(direction, length)
    raise RuntimeError.new("not a valid direction") unless DIRECTIONS.include?(direction)
    self.send(direction, length)
  end

  private
  def up_left(length)
    self.position_relative = -length, -length
    end

  def up(length)
    self.position_relative = 0, -length
  end

  def up_right(length)
    self.position_relative = length, -length
  end

  def right(length)
    self.position_relative = length, 0
  end

  def down_right(length)
    self.position_relative = length, length
  end

  def down(length)
    self.position_relative = 0, length
  end

  def down_left(length)
    self.position_relative = -length, length
  end

  def left(length)
    self.position_relative = -length, 0
  end
end

class King < Slide
  def initialize(position, board, color)
    super(position, board, color)
  end

  def to_s
    "♔".send(@color)
  end

  def move(direction)
    super(direction, 1)
  end
end

class Queen < Slide
  def initialize(position, board, color)
    super(position, board, color)
  end

  def to_s
    "♕".send(@color)
  end
end

class Rook < Slide
  def initialize(position, board, color)
    super(position, board, color)
  end

  def to_s
    "♖".send(@color)
  end

  def move(direction, length)
    valid_dir = [:up, :down, :left, :right]
    raise RuntimeError.new("invalid direction") unless valid_dir.include?(direction)
    super(direction, length)
  end
end

class Bishop < Slide
  def initialize(position, board, color)
    super(position, board, color)
  end

  def to_s
    "♗".send(@color)
  end

  def move(direction, length)
    valid_dir = [:up_left, :up_right, :down_left, :down_right]
    raise RuntimeError.new("invalid direction") unless valid_dir.include?(direction)
    super(direction, length)
  end
end

#might need to change superclass
class Pawn < Slide
  def initialize(position, board, color)
    super(position, board, color)
    @first_move = true
    @directions = (color == :white) ? [:down, :down_left, :down_right] : [:up, :up_left, :up_right]
  end

  def to_s
    "♙".send(@color)
  end

  def move(direction, length)
    raise RuntimeError.new("Must go in correct direction") unless @directions.include?(direction)
    if @first_move
      super(direction, length) if length < 3
      @first_move == false
    else
      super(direction, 1)
    end
  end

end

class Knight < Piece
  def initialize(position, board, color)
    super(position, board, color)
  end

  def to_s
    "♘".send(@color)
  end

  def verify_move(pos_new)
    relative_position = pos_new.first - @position.first, pos_new.last - @position.last
    relative_position.map(&:abs).sort == [1,2]
  end
end