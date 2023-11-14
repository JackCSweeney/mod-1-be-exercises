class Werewolf

    def initialize(name, location = nil)
        @name = name
        @location = location || 'London'
        @human = true
        @hungry = false
    end

    def name
        @name
    end

    def location
        @location
    end

    def human?
        @human
    end

    def wolf?
        !@human
    end

    def change!
        if @human == true
            @human = false
            @hungry = true
        else @human == false
            @human = true
        end
    end

    def hungry?
        @hungry
    end

    def consume(victim)
        if @human == true
            "I can't consume a victim as a human"
        else @human == false
            @hungry = false
            victim.status = :dead
        end
    end

end