# coding: utf-8
require './basic_pieces.rb'
require 'colorize'

class Chess

  def initialize(human_players = 2)
    case human_players
    when 2

    when 1
    else
    end
  end

  def play
   @board = Board.new
   #make sure to downcase input
   # x = ('a'..'z').to_a.index(letter)
   # y = number
  end

end

class Board

  def initialize
    @board = []
    generate_board
    generate_pieces
  end

  def []=(x, y, piece)
    @board[y][x] = piece
  end

  def [](x, y)
    @board[y][x]
  end

  def checkmate?
    #WRITE ME PLZ
  end

  def generate_board
    8.times do |row|
      row_board = []
      8.times do |col|
        row_board << nil
      end
      @board << row_board
    end
  end

  def generate_pieces
      self[0, 0] = Rook.new(  [0, 0], self, :white)
      self[1, 0] = Knight.new([1, 0], self, :white)
      self[2, 0] = Bishop.new([2, 0], self, :white)
      self[3, 0] = Queen.new( [3, 0], self, :white)
      self[4, 0] = King.new(  [4, 0], self, :white)
      self[5, 0] = Bishop.new([5, 0], self, :white)
      self[6, 0] = Knight.new([6, 0], self, :white)
      self[7, 0] = Rook.new(  [7, 0], self, :white)

      8.times do |pawn_count|
        self[pawn_count, 1] = Pawn.new([pawn_count, 1], self, :white)
      end

      8.times do |pawn_count|
        self[pawn_count, 6] = Pawn.new([pawn_count, 6], self, :black)
      end

      self[0, 7] = Rook.new(  [0, 7], self, :black)
      self[1, 7] = Knight.new([1, 7], self, :black)
      self[2, 7] = Bishop.new([2, 7], self, :black)
      self[3, 7] = Queen.new( [3, 7], self, :black)
      self[4, 7] = King.new(  [4, 7], self, :black)
      self[5, 7] = Bishop.new([5, 7], self, :black)
      self[6, 7] = Knight.new([6, 7], self, :black)
      self[7, 7] = Rook.new(  [7, 7], self, :black)
  end

  def move(start_pos, end_pos)
    if self[*start_pos].verify_move(end_pos)
      self[*end_pos]  = self[*start_pos]
      self[*end_pos].position = end_pos
      self[*start_pos] = nil
    else
      raise RuntimeError.new("Invalid move.")
    end
  end

  def to_s
    ret_str = ""
    @board.each_with_index do |row, y|
      row.each_with_index do |tile, x|
          if x % 2 == 0 && y % 2 == 0
            ret_str << "#{tile} ".to_s.colorize(:background => :green)
            ret_str << " ".colorize(:background => :green) if tile.nil?
          elsif x % 2 == 1 && y % 2 == 0
            ret_str << "#{tile} ".to_s.colorize(:background => :red)
            ret_str << " ".colorize(:background => :red) if tile.nil?
          elsif x % 2 == 0 && y % 2 == 1
            ret_str << "#{tile} ".to_s.colorize(:background => :red)
            ret_str << " ".colorize(:background => :red) if tile.nil?
          else
            ret_str << "#{tile} ".to_s.colorize(:background => :green)
            ret_str << " ".colorize(:background => :green) if tile.nil?
          end
        ret_str << " "
      end
      ret_str << "\n"
    end
    ret_str + "\n"
  end
end

class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_move

  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  # puts board
#   board.move([1, 0], [2, 2])
#   puts board
#   board.move([4, 0], [4, 1])
#   puts board
#   board.move([0, 0], [0, 2])
#   puts board
#   board.move([2, 0], [4, 2])
#   puts board
#   board.move([3, 0], [3, 5])
#   puts board
#   board.move([3, 5], [6, 2])
#   puts board

  puts board
  board.move([1, 1], [1, 2])
  puts board
  board.move([1, 2], [1, 3])
  board.move([1, 3], [1, 4])
  board.move([1, 4], [1, 5])
  puts board
  board.move([1, 5], [2, 6])
  puts board
end