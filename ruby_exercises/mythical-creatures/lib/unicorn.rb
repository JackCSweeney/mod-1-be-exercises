class Unicorn
    attr_accessor :name, :color

    def initialize(name, color = nil)
        @name = name
        if color == nil
            @color = 'silver'
        else
            @color = color
        end
    end

    def silver?
        @color == 'silver'
    end

    def color
        @color
    end

    def say(string)
        "**;* #{string} **;*"
    end
end
