require_relative "Card.rb"

class Board

    @@values = ["A","A","B","B","C","C","D","D","E","E","F","F","G","G","H","H","I","I"]

    def initialize(n)
        @grid = Array.new(n) {Array.new(n)}
        @size = n * n
        raise "please use an even board size" if @size % 2 != 0
        @cards = []
        @revealed = Hash.new(false)
    end

    def card_maker
        (0...@size).each do |i|
            @cards<<Card.new(@@values[i])
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def populate
        i = 0
        while i < @size
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if @grid[row][col] == nil
                @grid[row][col] = @cards[i]
                i+=1
            end
        end
    end

    def render
        # system("clear") 
        print "  "
        (0...@grid.length).each do |x|
            print x.to_s + " "
        end
        puts

        (0...@grid.length).each do |y|
            print y.to_s + " "
            (0...@grid.length).each do |n|
                print @grid[y][n].cardstate + " "
            end
            puts
        end
    end

   

    def pairs?(a,b)
        if @grid[a[0]][a[1]].faceup == @grid[b[0]][b[1]].faceup
            @revealed[@grid[a[0]][a[1]].faceup] = true
            return true
        else
            @revealed[@grid[a[0]][a[1]].faceup] = false
            return false
        end
    end

    def won?
        #@revealed.values.all?{|v| v == true}
        @cards.each do |ele|
            if @revealed[ele.faceup] == false
                return false
            end
        end
        return true
    end

    def flip(pos)
        row, col = pos
        @grid[row][col].flips
    end

    def valid_guess?(pos)
        row, col = pos
        raise "Not a valid guess!" if @grid[row][col].cardstate == @grid[row][col].faceup
        true
    end
end

