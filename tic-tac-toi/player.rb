class Player
    ROW_MAP = (:A..:C).zip(0..2).to_h
    TRANSLATOR = {
        row:lambda{|input| ROW_MAP[input.upcase.to_sym]},
        column:lambda{|input| input.to_i - 1}
    }
    attr_reader:marker
    attr_reader:name
    attr_accessor:score
    def initialize(name,marker)
        @name = name
        @marker = marker
        @score = 0
    end
    def get_player_move
        TRANSLATOR.map do |row_or_col,translator|
            get_coordinates(row_or_col,translator)
            
        end
    end
    def get_coordinates(row_or_col,translator)
        loop do
            print "Enter #{row_or_col}\n> : "
            input = gets.chomp
            choice =  translator.call(input)
            return choice if validate?(choice)
            puts "\ninvalid #{row_or_col}"
        end
    end
    def validate?(choice)
        (0..2).include?(choice)
    end
 
end