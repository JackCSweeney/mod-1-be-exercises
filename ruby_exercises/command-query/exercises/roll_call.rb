class RollCall
    def initialize
        @names = []
    end

    def longest_name
        longest_name = @names.sort_by do |name|
            name.length
        end
        longest_name[-1]
    end

    def << (name)
       @names << name
    end
end