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
            lines[2] += "  #{("a".."z").to_a[row]}"
            lines.each {|l| puts l}
            row += 1
        end
        puts ""
        puts "    1       2       3       4       5       6       7       8"
        3.times {puts ""}
    end

    def next_turn
        puts "Select a piece (format: A1 - H8)"
        puts "only select a Knight (denoted by an 'n' or 'N' on the board)"
        puts ""
        selection = gets.chomp
        3.times {puts ""}
    end


end