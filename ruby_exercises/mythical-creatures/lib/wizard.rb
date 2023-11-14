class Wizard
    
    def initialize(name, bearded = nil)
        @name = name
        @bearded = bearded || {:bearded => true}
        @rested = true
        @spells_cast = 0
    end

    def name
        @name
    end

    def bearded?
        if @bearded.values == [true]
            true
        else
            false
        end
    end

    def incantation(spell)
        "sudo #{spell}"
    end

    def rested?
        if @spells_cast >= 3
            @rested = false
        else
            @rested = true
        end
    end

    def cast
        @spells_cast += 1
        "MAGIC MISSILE!"
    end

end
