class Bag
    attr_accessor :contents
    def initialize
        @contents = []
    end

    def empty?
        if contents.length == 0
            true
        else
            false
        end
    end

    def count
        contents.length
    end

    def candies
        contents
    end

    def <<(candy)
        @contents << candy
    end

    def contains?(string)
        contents.any? do |candy|
            candy.type == string
        end
    end
end
