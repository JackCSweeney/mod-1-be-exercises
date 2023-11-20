class Clearance
    def initialize
        @items = []
    end

    def best_deal
        if @items.length == 0
            @items = nil
        else
            deal = @items.sort_by do |thing|
                thing.discount
            end
            deal[0].item
        end    
    end

    def <<(thing)
        @items << thing
    end
end
