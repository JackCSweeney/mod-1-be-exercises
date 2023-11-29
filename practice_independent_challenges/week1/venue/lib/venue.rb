class Venue

    attr_reader :name, :capacity, :patrons

    def initialize(name, capacity)
        @name = name
        @capacity = capacity
        @patrons = []
    end

    def add_patron(person)
        @patrons << person
    end

    def yell_at_patrons
        loud_patrons = @patrons.map do |name|
            name.upcase 
        end
    end

    def over_capacity?
        if @patrons.length > @capacity
            true
        else
            false
        end
    end

    def kick_out
        @patrons.pop
    end
end
