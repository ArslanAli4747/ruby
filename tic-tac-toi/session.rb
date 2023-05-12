require_relative 'game'
require_relative 'player'

class Session
    def initialize
        @players = [
            get_names(:X),
            get_names(:O)
            ]
        @ties = 0
        play_until_quit

    end
    def get_names(symb)
        print "\nWho want to pick #{symb}, Enter name\n> : "
        p_name = gets.chomp.strip
        Player.new(p_name,symb)
    end

    def play_until_quit
        print "\n---------------------Welcome to tic tac toe game------------------------\n"
        loop do
            @g = Game.new(@players)
            puts "\n ---------------Starting a new Game------------------\n"
            play_a_game
            @g.display_result(@ties,games_played)
            break unless play_again?
        end
        puts "\n-----------Goodbye-----------\n"
    end
    def play_a_game
        winner =  @g.play_until_win
        if winner
            puts "  winner is #{winner.name}"
            @g.update_score(winner)
        else
            puts "  its a tie"
            @ties+=1
        end    
    end
    def play_again?
        print "\n do you want to play again (Y/N) ?\n> : "
        loop do
            choice = gets.chomp.strip.upcase
            return true if choice == "Y"
            return false if choice == "N"
            puts "\ninvalid choice"
        end
    end
    def games_played
        @ties + @players[0].score + @players[1].score
    end
end