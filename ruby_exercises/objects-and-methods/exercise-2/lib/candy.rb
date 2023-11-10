class Candy
    attr_accessor :candy, :sugar
    def initialize(candy, sugar = nil)
        @candy = candy
        if sugar == nil
            @sugar = 100
        else
            @sugar = sugar
        end
    end

    def type
        @candy
    end

    def sugar
        @sugar
    end
end

