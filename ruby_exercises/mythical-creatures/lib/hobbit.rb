class Hobbit
    def initialize(name, disposition = nil)
        @name = name
        if disposition != nil
            @disposition = disposition
        else
            @disposition = 'homebody'
        end
        @age = 0
        if name == 'Frodo'
            @has_ring = true
        else
            @has_ring = false
        end         
    end

    def name
        @name
    end

    def disposition
        @disposition
    end

    def age
        @age
    end

    def celebrate_birthday
        @age += 1
    end

    def adult?
        case
        when @age <= 32
            false
        else
            true
        end
    end

    def old?
        case
        when @age >= 101
            true
        else
            false
        end
    end

    def has_ring?
        @has_ring
    end

    def is_short?
        true
    end

end