class Parrot
    attr_accessor :data
    def initialize(data)
        @data = data
        @sound = "Squawk!"
    end

    def name
        @data[:name]
    end

    def sound
        @sound
    end

    def known_words
        @data[:known_words]
    end
end