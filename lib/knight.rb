class Knight
    attr_accessor :position, :moves, :symbol
    require_relative 'knight_move'
    
    def initialize(pos)
        @position = get_coords(pos)
        @symbol = "H"
        get_moves
    end
    
    def get_path(end_string)
        start_coords = @position
        end_coords = get_coords(end_string)
        
        current_node = build_move_tree(start_coords, end_coords)
        
        path = []
        until current_node.position == start_coords
            path << current_node.position
            current_node = current_node.parent
        end
        path << current_node.position
    end
    
    private
    
    def build_move_tree(start, goal)
        current_node = self
        queue = [current_node]
        until current_node.position == goal #should I set up initialized knight with one move: stay still?
            current_node.moves.each do |move| 
                queue << Knight_Move.new(move, current_node)
            end
            queue.shift
            current_node = queue[0]
        end
        current_node
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
    
    def get_coords(string)
        col = [string[0].upcase]
        row = [string[1].to_i]
        
        cols = ("A".."H").to_a
        rows = (1..8).to_a
        
        coords_x = col.map { |c| cols.index(c) }
        coords_y = row.map { |r| rows.index(r) }
        
        return [coords_x[0], coords_y[0]]
    end
    
end