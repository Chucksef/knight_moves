class Knight
    attr_accessor :pos, :symbol
    require_relative 'node'

    def initialize(position)
        @pos = Node.new(coords(position))
        @symbol = "H"
        get_moves
    end

    def get_moves(n = @pos)
        current_x = @pos.col
        current_y = @pos.row

        relative_moves = [[1,2], [2,1], [2,-1], [1,-2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
        new_positions = []
        relative_moves.each do |move|
            new_positions << [ move[0]+current_x, move[1]+current_y] unless move[0]+current_x < 0 || move[0]+current_x > 7 || move[1]+current_y < 0 || move[1]+current_y > 7
        end
        new_positions.each do |x|
            n.moves << x
        end
    end

    def get_path(n = @pos)
    end

    private

    def coords(string)
        col = [string[0].upcase]
        row = [string[1].to_i]
        
        cols = ("A".."H").to_a
        rows = (1..8).to_a

        coords_x = col.map { |c| cols.index(c) }
        coords_y = row.map { |r| rows.index(r) }

        return [coords_x[0], coords_y[0]]
    end

end