class Pirate
    attr_accessor :name, :job
    def initialize(name, job = nil)
        @name = name
        @job = job || "Scallywag"
        @cursed = false
        @heinous_acts = 0
        @booty = 0
    end

    def name
        @name
    end

    def job
        @job
    end

    def cursed?
        @cursed
    end

    def commit_heinous_act
        @heinous_acts += 1
        if @heinous_acts >= 3
            @cursed = true
        end 
    end

    def booty
        @booty
    end

    def robs_ship
        @booty += 100
    end
end