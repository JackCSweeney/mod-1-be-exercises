class Item
    attr_accessor :item, :price, :discount
    def initialize(item, discount)
        @item = item
        @discount = discount
    end

    def item
        @item
    end

    def discount
        (@discount[:price])/(@discount[:discount])
    end
end
