class Catalog
    def initialize
        @catalog = []
    end

    def cheapest
        if @catalog.length != 0
            sorted = @catalog.sort_by do |product|
            product.price
            end
            sorted[0].product
        else
            @catalog[0]
        end
    end

    def <<(product)
        @catalog << product
    end
end