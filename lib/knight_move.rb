class Knight_Move
    attr_accessor :position, :moves, :parent

    def initialize(coords, parent = nil)
        @position = coords
        @parent = parent
        @moves = get_moves
    end

    def get_moves
        rel_moves = [[1,2], [2,1], [2,-1], [1,-2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
    
        @moves = rel_moves.select do |move|
            move[0] += @position[0]
            move[1] += @position[1]
            valid_move?(move)
        end
    end
        
    def valid_move?(move)
        move.all? { |element| element >= 0 && element <= 7 }
    end
end