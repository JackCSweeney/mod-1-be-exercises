class Narwhal
    attr_reader :data
    def initialize(data)
        @data = data
    end

    def name
        @data[:name]
    end

    def weight
        @data[:weight]
    end

    def cute?
        @data[:cute]
    end
end
