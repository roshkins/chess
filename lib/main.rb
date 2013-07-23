class Chess
  ## UI stuff

  def play
   @board = Board.new
  end

end

class Board
  ## Making board array

  def initialize()

    # TODO: generate_pieces
  end

  def generate_pieces
    # TODO: generate_pieces
  end

  def checkmate?

  end

  def [](letter, number)

    # TODO: returns piece object
  end

  def to_s
    # TODO: returns a string representation of the board
  end

end