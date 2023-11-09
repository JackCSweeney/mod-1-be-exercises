RSpec.describe 'inject pattern test' do

  it 'test 1' do
    numbers = [28, 12, 38, 1, 91]
    # Iterate over the numbers array defined above,
    # to find the difference of all the numbers
    difference = 0
    numbers.each do |number|
      difference = difference - number
    end
    expect(difference).to eq(-170)
  end

  it 'test 2' do
    bills = {
      rent: 800,
      car: 240,
      insurance: 110,
      medical: 1112
    }
    # Iterate over the bills hash defined above
    # to find the difference of all the values

    difference = 0
    bills.each do |(category, amount)|
      difference -= amount
    end
    expect(difference).to eq(-2262)
  end

  it 'test 3' do
    numbers = [2, 3, 5, 7]
    # Iterate over the numbers array defined above
    # to find the product of all the numbers

    product = 1
    numbers.each do |number|
      product = numbers.inject(:*)
    end
    expect(product).to eq(210)
  end

  it 'test 4' do
    scrabble_score = {
      letter_total: 23,
      word_muliplier: 3,
      bonus: 2
    }
    # Iterate over the scarbble_score hash defined above
    # to find the product of all the values

    product = 1
    scrabble_score.each do |(key, value)|
      product = scrabble_score.values.inject(:*)
    end
    expect(product).to eq(138)
  end

  it 'test 5' do
    airlines = ["Southwest", "Delta", "United", "Frontier"]
    # Iterate over the airlines array defined above to
    # create a hash with the name of the airline as the
    # key and the length of the name as the value

    number_of_letters = {}
    airlines.each do |name|
      number_of_letters[name] = name.length
    end

    expected = {
      "Southwest" => 9,
      "Delta" => 5,
      "United" => 6,
      "Frontier" => 8
    }
    expect(number_of_letters).to eq(expected)
  end

  it 'test 6' do
    topping_calories = {
      pepperoni: 430,
      sausage: 400,
      olives: 10,
      peppers: 10,
      onions: 20
    }
    # Iterate over the topping_calories hash defined above
    # to create an array of all the toppings

    toppings = []
    topping_calories.each do |name, cal|
      toppings << "#{name}"
    end

    expect(toppings).to eq(["pepperoni", "sausage", "olives", "peppers", "onions"])
  end

  it 'test 7' do
    elements = [["a", 1], ["b", 9], ["c", 21]]
    # Iterate over the elements array defined above
    # to find the sum of all the integers

    sum_of_second_values = 0
    elements.each do |array|
      sum_of_second_values += array[-1]
    end

    expect(sum_of_second_values).to eq(31)
  end

  it 'test 8' do
    toppings = {
      pepperoni: {
        calories: 430,
        quantity: 5
      },
      sausage: {
        calories: 400,
        quantity: 10
      },
      olives: {
        calories: 10,
        quantity: 20
      },
      peppers: {
        calories: 10,
        quantity: 20
      },
      onions: {
        calories: 20,
        quantity: 20
      }
    }
    # Iterate over the toppings hash defined above to find
    # total calories. You will need to multiply each topping's
    # calorie count by the quantity

    total_calories = 0
    calories = []
    array_with_cal_n_quant = []

    toppings.each do |food, info|
      array_with_cal_n_quant << info.values
    end
    array_with_cal_n_quant.each do |array|
      calories << array.inject(:*)
    end
    total_calories += calories.inject(:+)

    expect(total_calories).to eq(6950)
  end

  it 'test 9' do
    grades = {
      quizzes: [8, 5, 3, 6, 5],
      tests: [23, 21, 24],
      essays: [10, 11, 10],
      final: [47]
    }
    # Iterate over the elements array defined above
    # to calculate the final grade. The final grade is
    # calculated by averaging each category together and
    # summing all of the averages

    final_grade = 0.0
    grades.each do |item, scores|
      final_grade += (scores.inject(:+).to_f) / (scores.length)
    end

    expect(final_grade).to eq(85.40)
  end

  it 'test 10' do
    menu = {
      empanadas: {
        flavors: ["chicken", "potato", "steak", "veggie"],
        gluten_free: false
      },
      scones: {
        flavors: ["blueberry", "vanilla"],
        gluten_free: false
      },
      parfaits: {
        flavors: ["blueberry", "strawberry", "cherry"],
        gluten_free: true
      }
    }

    # Iterate over the menu hash above to create a printable
    # version of the menu

  printable_menu = "Menu:\n"
  menu_hash = {}
  menu_string = ""
  menu.each do |dish, data|
    menu_hash[dish] = data[:flavors].insert(-2, "and").push(
      ("#{dish}")
    ).push((
      if data[:gluten_free] == true
        "(gluten free)"
      else
        "(non gluten free)"
      end
    )).join(" ").insert(0, "- ")
  end
  menu_hash.each do |name, info|
    printable_menu << info.insert(-1, "\n")
  end

# struggling to figure out how to get the commas to only be placed in the correct places for these strings
# in a way that would work for large amounts of data (aka avoiding doing it manually for each dish)
    expected =  "Menu:\n"\
                "- chicken, potato, steak, and veggie empanadas (non gluten free)\n"\
                "- blueberry, and vanilla scones (non gluten free)\n"\
                "- blueberry, strawberry, and cherry parfaits (gluten free)\n"

    expect(printable_menu).to eq(expected)
  end
end
