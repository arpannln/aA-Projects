require_relative 'board'
require 'colorize'
require_relative 'cursor'
require 'byebug'
class Display
attr_reader :cursor

def initialize(board)
  @board = board
  @cursor = Cursor.new([0,0], @board)
end

def render
  @board.grid.each_with_index do |arr, x|
    arr.each_with_index do |piece, y|

      if @cursor.cursor_pos == [x,y]
        if piece.color == 'black'
          print piece.to_s.colorize(:green).colorize( :background => :red)
        else
          print piece.to_s.colorize(:yellow).colorize( :background => :red)
        end
      else

        if piece.color == 'black'
          if x % 2 == 0 && y % 2 == 1
            print piece.to_s.colorize(:green).colorize( :background => :black)
          end
          if x % 2 == 1 && y % 2 == 0
            print piece.to_s.colorize(:green).colorize( :background => :black)
          end
          if x % 2 == 1 && y % 2 == 1
            print piece.to_s.colorize(:green).colorize( :background => :white)
          end
          if x % 2 == 0 && y % 2 == 0
            print piece.to_s.colorize(:green).colorize( :background => :white)
          end


        elsif piece.color == 'white'
          if x % 2 == 0 && y % 2 == 1
            print piece.to_s.colorize(:yellow).colorize( :background => :black)
          end
          if x % 2 == 1 && y % 2 == 0
            print piece.to_s.colorize(:yellow).colorize( :background => :black)
          end
          if x % 2 == 1 && y % 2 == 1
            print piece.to_s.colorize(:yellow).colorize( :background => :white)
          end
          if x % 2 == 0 && y % 2 == 0
            print piece.to_s.colorize(:yellow).colorize( :background => :white)
          end
        else
          if x % 2 == 0 && y % 2 == 1
            print piece.to_s.colorize(:light_blue ).colorize( :background => :black)
          end
          if x % 2 == 1 && y % 2 == 0
            print piece.to_s.colorize(:light_blue ).colorize( :background => :black)
          end
          if x % 2 == 1 && y % 2 == 1
            print piece.to_s.colorize(:light_blue ).colorize( :background => :white)
          end
          if x % 2 == 0 && y % 2 == 0
            print piece.to_s.colorize(:light_blue ).colorize( :background => :white)
          end

        end
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
