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

    # could also use .find(name: "Big Mac").first[:insgredients] if we didn't 
    # know or want to look for the index of big mac
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

    # instead of doing two separate methods, and combining them in an array,
    # you could do a .map method after dishes with .map do |dish| dish[:name]
    # Example of different version with iteration through .map method: 
    dishes_names = stores[:olive_garden][:dishes].map do |dish| dish[:name]
    end
    
    #Original answer:
    #dishes_names = [stores.dig(:olive_garden, :dishes, 0, :name), 
    #stores.dig(:olive_garden, :dishes, 1, :name)]

    expect(dishes_names).to eq(['Risotto', 'Steak'])
  end

  it 'test 7' do
    # Return a list of employees across
    # all restaurants
    # Original answer:
    #employee_names = stores.dig(:olive_garden, :employees) +
    #stores.dig(:dennys, :employees) + 
    #stores.dig(:macdonalds, :employees)

    # Example of another method:
    # we make employee names into and empty array
    # then call .each to iterate through each key and its values
    # then we call the concat method with the argument of the values from stores that are :employees
    # to make all of the arrays of strings concatenate into one array of strings with each employee
    # then we end the iteration
    employee_names = []
    stores.each do |k,v|
      employee_names.concat(v[:employees])
    end
  

    expected = ["Jeff", "Zach", "Samantha", "Bob", "Sue", "James", "Alvin", "Simon", "Theodore"]
    expect(employee_names).to eq(expected)
  end

  it 'test 8' do
    # Return a list of all ingredients
    # across all restaurants
    # Original answer:
    # ingredients = stores.dig(:olive_garden, :dishes, 0, :ingredients) +
    # stores.dig(:olive_garden, :dishes, 1, :ingredients) +
    # stores.dig(:dennys, :dishes, 0, :ingredients) +
    # stores.dig(:dennys, :dishes, 1, :ingredients) +
    # stores.dig(:macdonalds, :dishes, 0, :ingredients) +
    # stores.dig(:macdonalds, :dishes, 1, :ingredients)

    # Additional example answer with new knowledge:
    # start with making ingredients an empty array that we can pass data into with our methods
    # call each_pair method on stores and have it iterate and assign each key value pair the name 'store' for keys,
    # 'data' for values
    # then we grab the :dishes keys from 'data' and and have it iterate and assign the value of each to 'dish'
    # then call concatenate on ingredients with the arguement dish while grabbing the values of :ingredients
    # keys. then we end both do statements/iterations
  ingredients = []
  stores.each_pair do |store, data|
    data[:dishes].each do |dish|
    ingredients.concat(dish[:ingredients])
    end
  end


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
    # Original answer:
    # full_menu_price = stores.dig(:olive_garden, :dishes, 0, :price) +
    # stores.dig(:olive_garden, :dishes, 1, :price)

    # New answer with more knowledge on iteration:
    # Start with pulling :olive_garden key value, then :dishes key value
    # iterate though its values and assign 'dish' as the name for those values
    # then shovel in the :price values of each iteration of 'dish' with +=
    # to change what full_menu_price is defined as
    full_menu_price = 0
    stores[:olive_garden][:dishes].each do |dish|
      full_menu_price += dish[:price]
    end
  
    

    expect(full_menu_price).to eq(27)
  end

  it 'test 10' do
    # Return the full menu for Olive Garden

    # Original answer:
    # Had to break everything down so we first dig to get the value of the key :dishes
    # that contains the array of two hashes. Then insert the two strings with the names
    # of the dishes before the hash that contains their dish info. Then, that new array
    # is sliced into portions containing 2 elements each and converted to individual
    # arrays. Then that array with two sub arrays has the to_h method called with no 
    # block given in order to turn the first element of each array into the key and
    # the second element of each array into the value.

    # olive_garden_menu = stores.dig(:olive_garden, :dishes).insert(
    #   0, "Risotto").insert(2, "Steak").each_slice(2).to_a.to_h

    # New answer with more knowledge on iteration:
    # Instantiate olive_garden_menu as an empty hash since that is the answer we want.
    # Dig into stores by going into :olive garden and the :dishes to get the 
    # values associated with that key. Iterate through the collection within
    # :dishes with .each and assign the return values as 'dish'.
    # Then we have the olive_garden_variable grab each iteration of dish
    # and assign the :name value as the key and have the return value of 'dish'
    # become the keys value pair.
    olive_garden_menu = {}
    stores[:olive_garden][:dishes].each do |dish|
      olive_garden_menu[dish[:name]] = dish
    end
    
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
    
    # Original answer:

    # olive_garden_menu = stores.dig(:olive_garden, :dishes).insert(
    #   0, "Risotto").insert(2, "Steak").each_slice(2).to_a.to_h

    # dennys_menu = stores.dig(:dennys, :dishes).insert(0, "Pancakes"
    # ).insert(2, "Waffles").each_slice(2).to_a.to_h

    # macdonalds_menu = stores.dig(:macdonalds, :dishes).insert(0, "Big Mac"
    # ).insert(2, "Fries").each_slice(2).to_a.to_h
    
    # full_menu = olive_garden_menu.merge(dennys_menu, macdonalds_menu)
      
    # New answer with iteration knowledge:
    # Instantiate full_menu as an empty hash.
    # Iterate over stores hash assigning each key as store, and its value pair as data
    # Pull :dishes key out of 'data' and iterate over :dishes array and assign each element as 'dish'
    # Then full_menu empty hash grabs each dish, pulls the value pair of the :name keys,
    # sets that value as a new key, and sets each 'dish' element as its value pair.

    full_menu = {}
    stores.each do |store, data|
      data[:dishes].each do |dish|
        full_menu[dish[:name]] = dish
      end
    end



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
