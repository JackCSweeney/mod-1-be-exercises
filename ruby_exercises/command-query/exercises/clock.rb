class Clock
    def initialize
        @time = 6
    end

    def time
        @time
    end

    def wait
        @time += 1
        if @time > 12
            @time = 1
        end
    end
end