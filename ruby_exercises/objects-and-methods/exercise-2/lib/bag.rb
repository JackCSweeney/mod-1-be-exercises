class Bag
    def initialize
        @bag = []
    end

    def empty?
        @bag.length == 0
    end

    def count
        @bag.length
    end

    def candies
        @bag
    end

    def << (candy)
        @bag << candy
    end

    def contains?(string)
        @bag.any? do |candy|
            candy.type == string
        end
    end

    def grab(string)
       if @bag.select do |candy|
        candy.type == string
            return @bag.delete(candy)
            end
        end
    end

    def take(num)
        @bag.pop(num)
    end
end