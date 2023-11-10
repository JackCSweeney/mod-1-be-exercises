class Ferret
    def initialize(name = nil)
        if name != nil
            @name = name
        end
    end

    def name
        @name
    end

    def give_name(name)
        @name = name
    end
end