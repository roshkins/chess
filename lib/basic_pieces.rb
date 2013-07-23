# coding: utf-8
require 'debugger'
class Piece
  attr_accessor :position
  attr_reader :color

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

  def verify_move(pos_new)
    @relative_position = [pos_new.first - @position.first, pos_new.last - @position.last]
    return false if @board[*pos_new] != nil && @board[*pos_new].color == self.color
    p "passed super verify test for #{pos_new}"
    true
  end

end

class Slide < Piece
  DIRECTIONS = [:up_left, :up, :up_right,  :right, :down_right, :down, :down_left, :left ]

  def initialize(position, board, color)
    super(position, board, color)
  end

  def move(direction, length)
    raise RuntimeError.new("not a valid direction") unless DIRECTIONS.include?(direction)
  end
end

class King < Slide
  def initialize(position, board, color)
    super(position, board, color)
  end

  def to_s
    "♔".send(@color)
  end

  def verify_move(pos_new)
    return false unless super(pos_new)
    @relative_position.map(&:abs).all?{ |coord| coord < 2 }

  end

end

class Queen < Slide
  def initialize(position, board, color)
    super(position, board, color)
  end

  def to_s
    "♕".send(@color)
  end

  def verify_move(pos_new)
    return false unless super(pos_new)
    rel = @relative_position.map(&:abs)
    return false if !@relative_position.any?(&:zero?) && rel.first != rel.last
    true
  end
end

class Rook < Slide
  def initialize(position, board, color)
    super(position, board, color)
  end

  def to_s
    "♖".send(@color)
  end

  def verify_move(pos_new)
    return false unless super(pos_new)
    return false if !@relative_position.any?(&:zero?) #if neither are zero
    true
  end

end

class Bishop < Slide
  def initialize(position, board, color)
    super(position, board, color)
  end

  def to_s
    "♗".send(@color)
  end

  def verify_move(pos_new)
    return false unless super(pos_new)
    rel = @relative_position.map(&:abs)
    return false if rel.first != rel.last #if abs.value are not equal
    true
  end
end

#might need to change superclass
class Pawn < Slide
  def initialize(position, board, color)
    super(position, board, color)
    @first_move = true
    end

  def to_s
    "♙".send(@color)
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
    super(pos_new)
    @relative_position.map(&:abs).sort == [1,2]
  end
end