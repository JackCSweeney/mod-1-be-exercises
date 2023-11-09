class MadLib
    attr_accessor :noun, :verb, :adjective, :adverb
    def initialize
    end

    def noun(string)
        @noun = string
    end

    def verb(string)
        @verb = string
    end

    def adjective(string)
        @adjective = string
    end

    def adverb(string)
        @adverb = string
    end

    def result
        "Do you #{@verb} your #{@adjective} #{@noun} #{@adverb}? That's hilarious!"
    end
end

