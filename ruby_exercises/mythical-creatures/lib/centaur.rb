class Centaur
    attr_accessor :name, :breed

    def initialize (name, breed)
        @name = name
        @breed = breed
        @standing = true
        @cranky = 0
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def shoot
        @cranky += 1
        if @cranky < 3 && @standing == true
            'Twang!!!'
        else
            "NO!"
        end
    end

    def run
        if @standing == true
            @cranky += 1
            'Clop clop clop clop!'
        else
            'NO!'
        end
    end

    def standing?
        @standing
    end

    def laying?
        @standing != true
    end

    def cranky?
        if @cranky >= 3
            true
        else
            false
        end
    end

    def sleep
        if @standing == true
            "NO!"
        else
            @cranky = 0
        end
    end

    def lay_down
        @standing = false
    end

    def stand_up
        @standing = true
    end

    def drink_potion
        if @standing == true && @cranky > 0
            @cranky = 0
        elsif @standing == false
            'NO!'
        elsif @cranky == 0 && @standing == true
            'Drinking this while rested will make me sick'
        end
    end

end



