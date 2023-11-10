class Octopus
    attr_accessor :nme, :friend
    def initialize(name, friend)
        @name = name
        @friend = friend
    end

    def name
       @name
    end

    def friend
        @friend
    end
end