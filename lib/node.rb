class Node
    attr_accessor :row, :col, :coords, :moves

    def initialize(coords)
        @coords = coords
        @col = @coords[0]
        @row = @coords[1]
        @moves = []
    end
end