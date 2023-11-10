class Quail
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def name
        @name.capitalize
    end
end