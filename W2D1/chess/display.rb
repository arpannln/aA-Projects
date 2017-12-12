require_relative 'board'
require 'colorize'
require_relative 'cursor'
require 'byebug'
class Display

def initialize(board)
  @board = board
  @cursor = Cursor.new([0,0], @board)
end

def render
  @board.grid.each_with_index do |arr, x|
    arr.each_with_index do |piece, y|

      if @cursor.cursor_pos == [x,y]
        print piece.to_s.colorize(:red)
      else
        print piece.to_s.colorize(:green)
      end
    end
    puts ""
  end
  cursor_position = @cursor.get_input

  #@board[cursor_position]
end

def move(new_pos)

end

end
