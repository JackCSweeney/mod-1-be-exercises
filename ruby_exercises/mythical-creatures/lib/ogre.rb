class Ogre
    attr_accessor :name, :home, :swings
    def initialize(name, home = nil)
        @name = name
        @home = home || "Swamp"
        @swings = 0
        @encounter_counter = 0
    end

    def name
        @name
    end

    def home
        @home
    end

    def encounter(human)
        @encounter_counter += 1
        human.encounter_counter += 1
        if human.encounter_counter % 3 == 0 && human.encounter_counter != 0
            self.swing_at(human)
        else
            @swings += 0
        end
    end

    def swing_at(human)
        human.swings_received
        @swings += 1
    end

    def swings
        @swings
    end

    def encounter_counter
        @encounter_counter
    end

    def apologize(human)
        human.swings_received = 0
    end


end

class Human
    attr_accessor :name, :encounter_counter, :swings_received, :knocked_out
    def initialize
        @name = "Jane"
        @encounter_counter = 0
        @swings_received = 0
        @knocked_out = false
    end

    def name
        @name
    end

    def encounter_counter
        @encounter_counter
    end

    def swings_received
        @swings_received += 1
    end

    def notices_ogre?
        if @encounter_counter % 3 == 0 && @encounter_counter != 0
            true
        else
            false
        end
    end

    def knocked_out?
        if @swings_received % 2 == 0 && @swings_received != 0
            @knocked_out = true
        else
            @knocked_out = false
        end
    end
end
