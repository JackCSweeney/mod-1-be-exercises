class Children
    attr_accessor :children
    def initialize
        @children = []
    end

    def eldest
        sort_by_age = @children.sort_by do |child|
            child.age
        end
        sort_by_age[-1]
    end
    
    def <<(child)
        @children << child
    end
end