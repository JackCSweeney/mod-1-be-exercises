class Direwolf
    attr_accessor :name, :home, :size, :starks_to_protect
    def initialize(name, home = nil, size = nil)
        @name = name
        if home != nil
            @home = home
        else 
            @home = 'Beyond the Wall'
        end
        if size != nil
            @size = size
        else
            @size = 'Massive'
        end
        @starks_to_protect = []
    end

    def name
        @name
    end

    def home
        @home
    end

    def starks_to_protect
        @starks_to_protect
    end

    def protects(stark)
        if stark.location == @home && @starks_to_protect.length < 2
            @starks_to_protect << stark
            stark.safe = true
        end
    end

    def hunts_white_walkers?
        case 
        when @starks_to_protect.length > 0
            false
        else @starks_to_protect.length == 0
            true
        end
    end

    def leaves(stark)
        stark.safe = false
        @starks_to_protect.delete(stark) 

    end
end

class Stark
    attr_accessor :name, :location, :safe, :protector
    def initialize(name, location = nil)
        @name = name
        if location != nil
            @location = location
        else
            @location = 'Winterfell'
        end
        @safe = false
        @house_words = 'Winter is Coming'
        
    end

    def name
        @name
    end

    def safe?
      @safe
    end

    def location
        @location
    end

    def house_words
        @house_words
    end
end




