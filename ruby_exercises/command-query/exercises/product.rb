class Product
    attr_accessor :product, :price
    def initialize(product, price)
        @product = product
        @price = price
    end

    def price
        @price
    end

    def product
        @product
    end
end
