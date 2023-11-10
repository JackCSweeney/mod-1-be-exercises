class Horse
    def initialize(name)
        @name = name
        @diet = []
    end

    def name
        @name
    end

    def diet
        @diet
    end

    def add_to_diet(food)
        @diet << food
    end
end