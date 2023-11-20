class Money
    def initialize
        @amount = 0
    end

    def earn(num)
        @amount += num
    end

    def amount
        @amount
    end
end
