class Game
    require_relative 'space'
    attr_accessor :pieces

    def initialize
        @pieces = set_up_board
    end

    def set_up_board
        spaces = []
        spaces << ["R", "N", "B", "Q", "K", "B", "N", "R"]
        spaces << ["P", "P", "P", "P", "P", "P", "P", "P"]
        4.times do
            spaces << Array.new(8) {" "}
        end
        spaces << ["p", "p", "p", "p", "p", "p", "p", "p"]
        spaces << ["r", "n", "b", "q", "k", "b", "n", "r"]
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

    def next_turn
        puts "Set the starting location for a hypothetical knight (format: A1 - H8)"
        puts ""
        start = gets.chomp
        3.times {puts ""}
        puts "Now set the ending point for where you want the knight to go."
        ending = gets.chomp
        Knight.new(start, ending)
        
    end


end