class Knight
    require_relative 'space'
    attr_accessor :pos, :goal

    def initialize(start, finish)
        @pos = coords(start)
        @goal = coords(finish)
        puts "#{@pos}"
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