# coding: utf-8
require './basic_pieces.rb'
require 'colorize'

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
    # self[0, 0] = King.new([0,0], self)
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
    ret_str = ""
    @chess_board.each_with_index do |row, y|
      row.each_with_index do |tile, x|
          ret_str << tile.to_s if tile
          if tile.nil?
            if x % 2 == 0 && y % 2 == 0
              ret_str << "■".white
            elsif x % 2 == 1 && y % 2 == 0
              ret_str << "▩".red.on_red
            elsif x % 2 == 0 && y % 2 == 1
              ret_str << "▩".red.on_red
            else
              ret_str << "■".white
            end
          end
          ret_str << " "
      end
      ret_str << "\n"
    end
    ret_str + "\n"
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  puts board
  king = King.new([3,0], board, :white)
  puts board
  king.move(:down)
  puts board
  king.move(:down_right)
  puts board
  king.move(:down_right)
  puts board
end