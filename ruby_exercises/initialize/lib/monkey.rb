class Monkey
    attr_accessor :data
    def initialize(data)
        @data = data
    end
    def name
        @data.first
    end

    def type
        @data[1]
    end

    def favorite_food
        @data.last
    end
end