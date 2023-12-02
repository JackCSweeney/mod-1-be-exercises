require 'rspec'
require './lib/potluck.rb'
require './lib/dish.rb'

RSpec.describe Potluck do
    it 'exists' do
        potluck = Potluck.new("7-13-18")

        expect(potluck).to be_a(Potluck)
    end

    it 'has a date' do
        potluck = Potluck.new("7-13-18")

        expect(potluck.date).to eq("7-13-18")
    end

    it 'starts with no dishes' do
        potluck = Potluck.new("7-13-18")
        
        expect(potluck.dishes).to eq([])
    end

    it 'can add a dish' do
        potluck = Potluck.new("7-13-18")

        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

        potluck.add_dish(couscous_salad)

        potluck.add_dish(cocktail_meatballs)

        expect(potluck.dishes).to eq([couscous_salad, cocktail_meatballs])
    end

    it 'can tell you how many dishes are stored in the potluck' do
        potluck = Potluck.new("7-13-18")

        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)

        potluck.add_dish(couscous_salad)

        potluck.add_dish(cocktail_meatballs)

        expect(potluck.dishes.length).to eq(2)
    end

    it 'can tell you dishes from specific categories' do
        potluck = Potluck.new("7-13-18")

        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)

        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)

        expect(potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
        expect(potluck.get_all_from_category(:dessert)).to eq([candy_salad])
    end

    it 'can tell you the first dish' do
        potluck = Potluck.new("7-13-18")

        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)

        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)

        expect(potluck.get_all_from_category(:appetizer).first).to eq([couscous_salad, summer_pizza])
    end

    it 'can tell you the name of the first dish' do
        potluck = Potluck.new("7-13-18")

        couscous_salad = Dish.new("Couscous Salad", :appetizer)
        summer_pizza = Dish.new("Summer Pizza", :appetizer)
        roast_pork = Dish.new("Roast Pork", :entre)
        cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
        candy_salad = Dish.new("Candy Salad", :dessert)

        potluck.add_dish(couscous_salad)
        potluck.add_dish(summer_pizza)
        potluck.add_dish(roast_pork)
        potluck.add_dish(cocktail_meatballs)
        potluck.add_dish(candy_salad)

        expect(potluck.get_all_from_category(:appetizer).first.name).to eq([couscous_salad, summer_pizza])
    end
end