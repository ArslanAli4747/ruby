class Board
    attr_accessor :grid
        def initialize(height,width)
            @height = height
            @width = width
            @grid = Array.new(height){Array.new(width){:" "}}
        end
        def print_Board()
            # @grid.each do |row|
            #     puts
            #     row.each do |col|
            #         print "[#{col}]"
            #     end
            # end
            output = "\n"
            output<<display_header
            output<<display_rows
            output<<"\n"

        end
        def display_header
            (1..@width).reduce("    "){|a,e| a<<"  #{e}"}<<"\n"
        end
        def display_rows
            letter = "@"
            @grid.reduce("") do |ouput,row|
                letter = letter.next
                ouput<<row_formate(row,letter)
                
            end
        end
        def row_formate(row,letter)
            row.reduce("   #{letter} "){|row_string,val| row_string<<"[#{val}]"}<<"\n"
        end
        def row_win(marker)
            grid.any? do |row|
                row.all? do |col|
                    col == marker
                end
            end
        end
        def col_win(marker)
            (0...@width).any? do |col|
                @grid.all? do |row|
                    row[col] == marker
                end
            end
        end
        # [0][0] [1,1] [2,2] // [0,2] [1,1] [2,0]
        # def diagnol_win(marker)
        #     left = (0...@height).all? do |d|
        #         @grid[d][d] == marker
        #     end
                
        #     right =  (0...@height).all? do |d|
        #         @grid[d][@width - 1 - d] == marker
        #     end
        #     if left || right 
        #         return true
        #     else
        #         return false
        #     end
            
        # end
        def diagnol_win(marker)
            [lambda {|x| x},lambda {|x| -(x+1)}].any? do |proc|
                (0...@height).all? do |j|
                    @grid[j][proc.call(j)] == marker
                end
            end
        end
        def winner?(player)
            marker = player.marker
            diagnol_win(marker)||col_win(marker)||row_win(marker)
        end
        def place_maker(moves,marker)
            y,x = moves
            @grid[y][x] = marker if @grid[y][x]==:" "
        end
        def is_full?
            @grid.any? do |row|
                row.any? do |col|
                    col == :" "
                end
            end
        end
   
    end
    
    # def check_for_win()
    #     @gameboard.print_Board()
    #     puts
    #     puts "row win for X : #{@gameboard.row_win(:X)}"
    #     puts "row win for O : #{@gameboard.row_win(:O)}"
        
    #     puts "col win for X : #{@gameboard.col_win(:X)}"
    #     puts "col win for O : #{@gameboard.col_win(:O)}"
        
    #     puts "diagnol win for X : #{@gameboard.diagnol_win(:X)}"
    #     puts "diagnol win for O : #{@gameboard.diagnol_win(:O)}"
    # end
    
    # @gameboard = Board.new(3,3)
    
    # check_for_win()
    # @gameboard[0,2] = :X
    # check_for_win()
    # @gameboard[1,1] = :X
    # check_for_win()
    # @gameboard[2,0] = :X
    # check_for_win()
    