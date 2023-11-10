class Rabbit
    attr_accessor

    def initialize(data)
        @data = data
    end

    def name
        if @data[:num_syllables] == 2
            "#{@data[:name]} Rabbit"
        else
            @data[:name]
        end
    end
end