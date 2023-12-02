require 'rspec'
require './lib/dish.rb'

RSpec.describe Dish do
    it 'exists' do
        dish = Dish.new("Couscous Salad", :appetizer)

        expect(dish).to be_a(Dish)
    end

    it 'can tell its name' do
        dish = Dish.new("Couscous Salad", :appetizer)

        expect(dish.name).to eq("Couscous Salad")
    end

    it 'can tell its category' do
        dish = Dish.new("Couscous Salad", :appetizer)

        expect(dish.category).to eq(:appetizer)
    end
end