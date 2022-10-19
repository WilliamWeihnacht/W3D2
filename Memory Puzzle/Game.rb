require_relative "Board.rb"
require_relative "HumanPlayer.rb"
require_relative "ComputerPlayer.rb"

class Game
    def initialize(n, name1, name2)
        @board = Board.new(n)
        @player_1 = HumanPlayer.new(name1)
        @player_2 = ComputerPlayer.new(n, name2)
        @current_player = @player_1
    end

    def switch_player
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        @board.card_maker
        @board.populate
        while !@board.won?
            begin
                @board.render
                p "#{@current_player.name} guess first position."
                pos1 = @current_player.get_input
                @player_2.receive_revealed_card(pos1, @board[pos1].faceup)
                @player_2.guessed << pos1
                @board.valid_guess?(pos1)
            rescue
                p "Invalid guess, try again!"
                sleep(1) 
                retry 
            end
            
            @board.flip(pos1)
            begin
                @board.render
                p "#{@current_player.name} guess second position."
                pos2 = @current_player.get_input
                @player_2.receive_revealed_card(pos2, @board[pos2].faceup)
                @board.valid_guess?(pos2)
            rescue
                p "Invalid guess, try again!" 
                sleep(1)
                retry
            end
            @board.flip(pos2)
            @board.render
            if !@board.pairs?(pos1, pos2)
                @board.flip(pos1)
                @board.flip(pos2)
                p "Not a match!"
                self.switch_player
                sleep(1)
            end
        end
        @board.render
        p "#{@current_player.name} won!"
    end
end

g = Game.new(4, "Alex", "Will")
g.play
