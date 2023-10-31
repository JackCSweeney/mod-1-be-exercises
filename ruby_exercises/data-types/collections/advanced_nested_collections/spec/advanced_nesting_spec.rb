require_relative 'nesting'

# The intent of this exercise is to practice working with nested collections.
# Some tests will be able to pass without any enumeration, and others will require
# more complex iteration over multiple portions of the nested collection.

# All tests can be completed without using any enumerable other than #each.
# My suggestion would be to complete all tests using only #each, and then
# to go back over each test and refactor it using a different enumerable.

# The collection you're going to be using lives in ./nesting.rb and is called stores.
# If you spot an error or want to make this exercise better, please let us know!


RSpec.describe 'Advanced Nested Collections' do
  it 'test 1' do
    # EXAMPLE
    employees = stores[:olive_garden][:employees]

    expected = ["Jeff", "Zach", "Samantha"]
    expect(employees).to eq(expected)
  end

  it 'test 2' do
    # Find the ingredients for pancakes
    pancake_ingredients = stores[:dennys][:dishes][0][:ingredients]

    expected = ["Flour", "Eggs", "Milk", "Syrup"]
    expect(pancake_ingredients).to eq(expected)
  end

  it 'test 3' do
    # Find the price of risotto
    risotto_price = stores[:olive_garden][:dishes][0][:price]

    expect(risotto_price).to eq(12)
  end

  it 'test 4' do
    # Find the ingredients for a Big Mac
    big_mac_ingredients = stores[:macdonalds][:dishes][0][:ingredients]

    expected = ['Bun','Hamburger','Ketchup','pickles']
    expect(big_mac_ingredients).to eq(expected)
  end

  it 'test 5' do
    # Find a list of restaurants
    store_names = stores.keys

    expected = [:olive_garden, :dennys, :macdonalds]
    expect(store_names).to eq(expected)
  end

  it 'test 6' do
    # Find dishes names for Olive Garden
    dishes_names = [stores.dig(:olive_garden, :dishes, 0, :name), 
    stores.dig(:olive_garden, :dishes, 1, :name)]

    expect(dishes_names).to eq(['Risotto', 'Steak'])
  end

  it 'test 7' do
    # Return a list of employees across
    # all restaurants
    employee_names = stores.dig(:olive_garden, :employees) +
  stores.dig(:dennys, :employees) + 
  stores.dig(:macdonalds, :employees)

  

    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end

  it 'test 8' do
    # Return a list of all ingredients
    # across all restaurants
    ingredients = stores.dig(:olive_garden, :dishes, 0, :ingredients) +
    stores.dig(:olive_garden, :dishes, 1, :ingredients) +
    stores.dig(:dennys, :dishes, 0, :ingredients) +
    stores.dig(:dennys, :dishes, 1, :ingredients) +
    stores.dig(:macdonalds, :dishes, 0, :ingredients) +
    stores.dig(:macdonalds, :dishes, 1, :ingredients)

    expected = [
      "Rice",
      "Cheese",
      "Butter",
      "Beef",
      "Garlic",
      "Flour",
      "Eggs",
      "Milk",
      "Syrup",
      "Flour",
      "Eggs",
      "Syrup",
      "Bun",
      "Hamburger",
      "Ketchup",
      "pickles",
      "Potatoes",
      "Salt"
    ]
    expect(ingredients).to eq(expected)
  end

  it 'test 9' do
    # Return the full menu price for Olive Garden
    full_menu_price = stores.dig(:olive_garden, :dishes, 0, :price) +
    stores.dig(:olive_garden, :dishes, 1, :price)

    expect(full_menu_price).to eq(27)
  end

  it 'test 10' do
    # Return the full menu for Olive Garden

    # Had to break everything down so we first dig to get the value of the key :dishes
    # that contains the array of two hashes. Then insert the two strings with the names
    # of the dishes before the hash that contains their dish info. Then, that new array
    # is sliced into portions containing 2 elements each and converted to individual
    # arrays. Then that array with two sub arrays has the to_h method called with no 
    # block given in order to turn the first element of each array into the key and
    # the second element of each array into the value.
    olive_garden_menu = stores.dig(:olive_garden, :dishes).insert(
      0, "Risotto").insert(2, "Steak").each_slice(2).to_a.to_h
    
    expected = {
      "Risotto" => {
        :name => "Risotto",
        :ingredients => ["Rice", "Cheese", "Butter"],
        :price => 12
      },
      "Steak" => {
        :name => "Steak",
        :ingredients => ["Beef", "Garlic"],
        :price => 15
      }
    }
    expect(olive_garden_menu).to eq(expected)
  end

  it 'test 11' do
    # Return a full menu across all restaurants
    olive_garden_menu = stores.dig(:olive_garden, :dishes).insert(
      0, "Risotto").insert(2, "Steak").each_slice(2).to_a.to_h

    dennys_menu = stores.dig(:dennys, :dishes).insert(0, "Pancakes"
    ).insert(2, "Waffles").each_slice(2).to_a.to_h

    macdonalds_menu = stores.dig(:macdonalds, :dishes).insert(0, "Big Mac"
    ).insert(2, "Fries").each_slice(2).to_a.to_h
    
    full_menu = olive_garden_menu.merge(dennys_menu, macdonalds_menu)
      


    expected = {
      "Risotto" => {
        :name => "Risotto",
        :ingredients => ["Rice", "Cheese", "Butter"],
        :price => 12
      },
      "Steak" => {
        :name => "Steak",
        :ingredients => ["Beef", "Garlic"],
        :price => 15
      },
      "Pancakes" => {
        :name => "Pancakes",
        :ingredients => ["Flour", "Eggs", "Milk", "Syrup"],
        :price => 10
      },
      "Waffles" => {
        :name => "Waffles",
        :ingredients => ["Flour", "Eggs", "Syrup"],
        :price => 7
      },
      "Big Mac" => {
        :name => "Big Mac",
        :ingredients => ["Bun", "Hamburger", "Ketchup", "pickles"],
        :price => 5
      },
      "Fries" => {
        :name => "Fries",
        :ingredients => ["Potatoes", "Salt"],
        :price => 2
      }
    }
    expect(full_menu).to eq(expected)
  end
end
