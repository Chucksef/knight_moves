class Game
    require_relative 'space'
    attr_accessor :pieces

    def initialize
        @pieces = set_up_board

    end

    def set_up_board
        spaces = []
        8.times do
            spaces << Array.new(8) {" "}
        end
        spaces.each_with_index { |row, idx| puts "row #{idx}: #{row}"}
    end

    def print_board
        head = ""
        system "clear"
        puts ""
        puts "                        CHESS OR WHATEVER"
        puts ""
        8.times {head += " _______"}
        puts head
        8.times do
            lines = Array.new(4) {"|"}
            8.times do
                lines[0] += "       |"
                lines[1] += "       |"
                lines[2] += "       |"
                lines[3] += "_______|"
            end
            lines.each {|l| puts l}
        end
        4.times {puts ""}
    end


end

game = Game.new
game.print_board
