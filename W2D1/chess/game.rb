require_relative 'board'
require_relative 'display'

class Game

  attr_accessor :board

  def initialize(player1, player2)
    @board = Board.new()
    @display = Display.new(@board)
    @white = player1
    @black = player2
  end

  def play
    render_loop

  end

  def render_loop

    10.times do
      @display.render
      puts "-----------------------------"
    end

  end

  private

  def notify_players

  end

  def swap_turn!

  end

end

if __FILE__ == $0

  game = Game.new("white", "black")
  game.play
  game.board.move_piece("white",[0,0],[3,2])
  game.play
end
