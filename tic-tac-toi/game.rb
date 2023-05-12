require_relative 'GameBoard'
class Game
    attr_accessor :gameboard
    def initialize(players)
        @players = players
        @gameboard = Board.new(3,3)
    end
    def play_until_win
        current_player,other_player = @players
        until @winner || !@gameboard.is_full?
            player_turn(current_player)
            current_player,other_player = other_player,current_player
        end
        puts @gameboard.print_Board()
        @winner
    end
    def player_turn(player)
        puts @gameboard.print_Board()
        puts "its #{player.name} turn"
        loop do
            moves =player.get_player_move
            break if @gameboard.place_maker(moves,player.marker)
            puts "\ninvalid move, try a valid move\n"
        end
        @winner = player if @gameboard.winner?(player)
    end
    def update_score(player)
        player.score+=1
    end
    def display_result(ties,game_no)
        print "\n---------- Score Card --------------\n"
        puts "\n  score after #{game_no} games"
        puts "  #{@players[0].name} has won #{@players[0].score}"
        puts "  #{@players[1].name} has won #{@players[1].score}"
        puts "  #{@players[0].name} and #{@players[1].name} tied #{ties} times"
        print "\n               -------------                \n"
    end

end