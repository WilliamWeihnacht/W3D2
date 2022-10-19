class HumanPlayer
    def initialize(name)
        @name = name
    end

    def name
        @name
    end

    def get_input
        input = gets.chomp.split(" ").map(&:to_i)
        input
    end

end