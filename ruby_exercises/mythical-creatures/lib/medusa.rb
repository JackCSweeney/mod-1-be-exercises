class Medusa
    attr_accessor :statues
    def initialize(name)
        @name = name
        @statues = []
    end

    def stare(person)
        person.stoned = true
        if @statues.count < 3
        @statues << person
        else
            @statues.shift.stoned = false
            @statues << person
        end
    end

    def name
        @name
    end

end

class Person
    attr_accessor :name, :stoned
    def initialize(name)
        @name = name
        @stoned = false
    end

    def stoned?
        @stoned
    end
end
