class Potluck

    attr_reader :date, :dishes

    def initialize(date)
        @date = date
        @dishes = []
    end

    def add_dish(dish)
        @dishes << dish
    end

    def get_all_from_category(category)
        dishes_from_category = []
        @dishes.each do |dish|
            if dish.category == category
                dishes_from_category << dish
            end
        end
        dishes_from_category
    end
end