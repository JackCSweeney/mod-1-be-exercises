class Potluck

    attr_reader :date, :dishes

    def initialize(date)
        @date = date
        @dishes = []
        @menu = {}
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

    def get_all_names_from_category(category)
        names_from_category = []
        @dishes.each do |dish|
            if dish.category == category
                names_from_category << dish.name
            end
        end
        names_from_category
    end

    def menu
        @dishes.each do |dish|
            @menu[dish.category] = get_all_names_from_category(dish.category).sort
        end
        @menu
    end


end