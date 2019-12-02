class Game
    attr_accessor :pieces
    require_relative 'knight_move'
    require_relative 'knight'

    def initialize
        @pieces = set_up_board
    end

    def set_up_board
        spaces = []
        8.times do
            spaces << Array.new(8) {" "}
        end
        spaces
    end

    def print_board
        head = ""
        system "clear"
        puts ""
        puts "                        CHESS OR WHATEVER"
        puts ""
        puts "    A       B       C       D       E       F       G       H"
        8.times {head += " _______"}
        puts head
        row = 0
        8.times do
            lines = Array.new(4) {"|"}
            col = 0
            8.times do
                lines[0] += "       |"
                lines[1] += "       |"
                lines[2] += "   #{@pieces[row][col]}   |"
                lines[3] += "_______|"
                col += 1
            end
            lines[2] += "  #{(1..8).to_a[row]}"
            lines.each {|l| puts l}
            row += 1
        end
        3.times {puts ""}
    end

    def spawn_knight
        puts "Choose a space to put your knight (format: A1 - H8)"
        puts ""
        start = gets.chomp
        2.times {puts ""}
        kn = Knight.new(start)

        add_piece(kn)
        add_targets(kn)

        puts "Now set the ending point for where you want the knight to go."
        puts ""
        ending = gets.chomp

        knight_moves(kn, ending)
    end

    def add_piece(piece)
        @pieces[piece.position[1]][piece.position[0]] = piece.symbol
        print_board
    end

    def add_targets(piece)
        #shows valid movement locations for a piece

        valid_spaces = piece.moves
        valid_spaces.each do |space|
            @pieces[space[1]][space[0]] = "O"
        end
        print_board
    end

    def knight_moves(piece, end_point)
        #reset all "O" squares to be blank
        @pieces.each_with_index do |row, id0|
            row.each_with_index do |cel, id1|
                @pieces[id0][id1] = " " if cel == "O"
            end
        end

        path = piece.get_path(end_point)

        path.reverse!
        
        path.each_with_index do |space, idx|
            @pieces[space[1]][space[0]] = idx.to_s if idx > 0
        end
        print_board
    end



end