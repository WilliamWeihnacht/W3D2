class ComputerPlayer


    def initialize(n, name)
        @name = name
        @size = n
        @guesses = {}
        @guessed = []
    end

    def name
        @name
    end

    def guessed
        @guessed
    end

    def receive_revealed_card(pos, v)
        @guesses[pos] = v
    end

    def get_input
        puts "Guesses:"
        print @guesses
        puts
        puts "Guessed"
        print @guessed
        keys = @guesses.each_key
        keys.each_with_index do |k1, i1|
            keys.each_with_index do |k2, i2|
                if  (@guesses[k1] == @guesses[k2]) && i2 > i1 && !@guessed.include?(k1) 
                    puts "guessing k1"
                    return k1
                elsif  (@guesses[k1] == @guesses[k2]) && i2 > i1 && !@guessed.include?(k2) 
                    puts "guessing k2"
                    return k2
                end
            end
        end
        puts "guessing randomly"
        row = rand(0...@size)
        col = rand(0...@size)
        return [row, col]
    end
end