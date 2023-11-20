class Kid
    def initialize
        @sugar = 0
        @hyperactive = false
    end

    def grams_of_sugar_eaten
        @sugar
    end

    def eat_candy
        @sugar += 5
    end

    def hyperactive?
        if @sugar >= 60
            @hyperactive = true
        else
            @hyperactive
        end
    end
end