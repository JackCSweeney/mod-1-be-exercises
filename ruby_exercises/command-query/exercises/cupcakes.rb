class Cupcakes
    def initialize
        @cupcakes = []
    end

    def <<(cupcake)
        @cupcakes << cupcake
    end

    def sweetest
        sorted = @cupcakes.sort_by do |cupcake|
            cupcake.sugar
        end
        sorted[-1]
    end
end