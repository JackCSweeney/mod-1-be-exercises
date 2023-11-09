class Candy
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def type
        @name
    end
end
