class Vampire

    def initialize(name, pet = nil)
        @name = name
        @pet = pet || 'bat'
        @thirsty = true
    end

    def name
        @name
    end

    def pet
        @pet
    end

    def thirsty
        @thirsty
    end

    def drink
        @thirsty = false
    end
end