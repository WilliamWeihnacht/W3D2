class Card

    def initialize(value)
        @faceup = value
        @facedown = "-"
        @cardstate = @facedown
    end

    def faceup
        @faceup
    end

    def facedown
        @facedown
    end

    def cardstate
        @cardstate
    end

    def hide
        @cardstate = @facedown
    end

    def reveal
        @cardstate = @faceup
    end

    def flips
        if @cardstate == @faceup
            @cardstate = @facedown
        else
            @cardstate = @faceup
        end
    end

    # def ==(other)
    #     if @faceup == other.faceup
    #         return true
    #     else
    #         return false
    #     end
    # end

    def to_s(arg)
        return arg.to_s
    end


end