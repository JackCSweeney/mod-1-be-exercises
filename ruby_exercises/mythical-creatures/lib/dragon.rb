class Dragon
    def initialize(name, color, rider)
        @name = name
        @color = color
        @rider = rider
        @hungry = 0
    end

    def name
        @name
    end

    def rider
        @rider
    end

    def color
        @color
    end

    def hungry?
        case
        when @hungry < 3
            true
        else
            false
        end
    end

    def eat
        @hungry += 1
    end
end