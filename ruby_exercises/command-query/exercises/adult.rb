class Adult
    def initialize
        @sober = true
        @beverage_count = 0
    end

    def consume_an_alcoholic_beverage
        @beverage_count += 1
    end

    def sober?
        if @beverage_count <= 2
            @sober = true
        else
            @beverage_count >2
            @sober = false
        end
    end
end