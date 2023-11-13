class Lovisa
    def initialize(title, characteristics = nil)
        @title = title
         if characteristics != nil
            @characteristics = characteristics
         else
            @characteristics = ['brilliant']
         end
    end

    def title
        @title
    end

    def characteristics
        @characteristics
    end

    def brilliant?
        if @characteristics.include?('brilliant')
            true
        else
            false
        end
    end

    def kind?
        if @characteristics.include?('kind')
            true
        else
            false
        end
    end

    def say(string)
        "**;* #{string} **;*"
    end
end


