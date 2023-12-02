require 'rspec'
require './lib/potluck.rb'

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
end