class Lion
    attr_accessor :data
    def initialize(data)
        @data = data
    end

    def name
        @data[:name]
    end

    def sound
        @data[:sound]
    end
end
