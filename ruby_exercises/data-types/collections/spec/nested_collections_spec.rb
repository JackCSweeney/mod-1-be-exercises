RSpec.describe 'Nested Collections' do
  it 'test 1' do
    coordinates = [[2,5],[87,2],[56,39],[3,46]]
    # Using the coordinates variable defined above
    # Retrive the second element
    second = coordinates[1]

    expect(second).to eq([87, 2])
  end

  it 'test 2' do
    coordinates = [[2,5],[87,2],[56,39],[3,46]]
    # Using the coordinates variable defined above
    # Retrive the value 39
    thirty_nine = coordinates[2][-1]
    expect(thirty_nine).to eq(39)
  end

  it 'test 3' do
    coordinates = [[2,5],[87,2],[56,39],[3,46]]
    # Using the coordinates variable defined above
    # set the last coordinates to [6, 55]
    coordinates.pop
    coordinates.push([6,55])

    expected = [[2,5],[87,2],[56,39],[6,55]]
    expect(coordinates).to eq(expected)
  end

  it 'test 4' do
    coordinates = [[2,5],[87,2],[56,39],[3,46]]
    # Using the coordinates variable defined above
    # set the second element of the last coordinates
    # to 0
    coordinates.fetch(-1).fill(0, 1)
    # fill method takes argument (x, y) where x is the replacement/new value, y is the index position

    expected = [[2,5],[87,2],[56,39],[3, 0]]
    expect(coordinates).to eq(expected)
  end

  it 'test 5' do
    coordinates = [[2,5],[87,2],[56,39],[3,46]]
    # Using the coordinates variable defined above
    # add the coordinate [4, 14]
    coordinates.push([4, 14])

    expected = [[2,5],[87,2],[56,39],[3,46],[4, 14]]
    expect(coordinates).to eq(expected)
  end

  it 'test 6' do
    team = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    # Using the team variable defined above
    # retrieve all of the pitchers

    # Original answer:
    # pitchers = team.fetch(:pitchers)

    # Additional option:
    pitchers = team[:pitchers]

    expected = ["Kenny", "Joan", "Shabaz"]
    expect(pitchers).to eq(expected)
  end

  it 'test 7' do
    team = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    # Using the team variable defined above
    # add "Phil" as a pitcher

    # Original answer:
    # team.fetch(:pitchers).push("Phil")

    # Additional answer:
    team[:pitchers].push("Phil")

    expected = {
      pitchers: ["Kenny", "Joan", "Shabaz", "Phil"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    expect(team).to eq(expected)
  end

  it 'test 8' do
    team = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    # Using the team variable defined above
    # create a new key :coaches with the value
    # of an empty array
    team.store(:coaches, [])

    expected = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"],
      coaches: []
    }
    expect(team).to eq(expected)
  end

  it 'test 9' do
    team = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    # Using the team variable defined above
    # Find out how many fielders there are

    # Original answer:
    # num_fielders = team.fetch(:fielders).length

    # Additional answer:
    num_fielders = team[:fielders].count
  
    expect(num_fielders).to eq(5)
  end

  it 'test 10' do
    team = {
      pitchers: ["Kenny", "Joan", "Shabaz"],
      fielders: ["Luke", "Chris", "Megan", "Mark", "Mackenzie"],
      catchers: ["Johnny"]
    }
    # Using the team variable defined above
    # Find out if "Kenny" is a pitcher

    # Original answer"
    # kenny_is_pitcher = team.fetch(:pitchers).include?("Kenny")

    # Additional answer:
    kenny_is_pitcher = team[:pitchers].include?("Kenny")

    expect(kenny_is_pitcher).to eq(true)
  end

  it 'test 11' do
    # HINT: You may find it valuable to break the three_day_forecast variable
    # into multiple lines to make it more readable

    three_day_forecast = {
      days: [{high: 70,low: 63,summary: "Mostly Sunny"},
    {high: 55,low: 47,summary: "Partly Cloudy"},
    {high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656
  }
    # Using the three_day_forecast variable defined above,
    # retrieve the expected piece of information

    # Original answer:
    # actual = three_day_forecast.fetch(:ref_num)

    # Additional answer:
    actual = three_day_forecast[:ref_num]

    expected = 3456789765456787656
    expect(actual).to eq(expected)
  end

  it 'test 12' do
    three_day_forecast = {
      days: [{high: 70,low: 63,summary: "Mostly Sunny"},
      {high: 55,low: 47,summary: "Partly Cloudy"},
      {high: 77,low: 64,summary: "Sunny"}], 
      "date" => "6-21-18",ref_num: 3456789765456787656}
    # Using the three_day_forecast variable defined above,
    # retrieve the expected piece of information

    # Can also just use [:days] right after three_day_forecast instead of fetch method
    actual = three_day_forecast.fetch(:days)
    expected = [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}]
    expect(actual).to eq(expected)
  end

  it 'test 13' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},
    {high: 55,low: 47,summary: "Partly Cloudy"},
    {high: 77,low: 64,summary: "Sunny"}], 
    "date" => "6-21-18",ref_num: 3456789765456787656}
    # Using the three_day_forecast variable defined above,
    # retrieve the expected piece of information

    actual = three_day_forecast.fetch("date")
    expected = "6-21-18"
    expect(actual).to eq(expected)
  end

  it 'test 14' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},
    {high: 55,low: 47,summary: "Partly Cloudy"},
    {high: 77,low: 64,summary: "Sunny"}], 
    "date" => "6-21-18",ref_num: 3456789765456787656}
    # Using the three_day_forecast variable defined above,
    # retrieve the expected piece of information

    actual = three_day_forecast.keys
    expected = [:days, "date", :ref_num]
    expect(actual).to eq(expected)
  end

  it 'test 15' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},
    {high: 55,low: 47,summary: "Partly Cloudy"},
    {high: 77,low: 64,summary: "Sunny"}], 
    "date" => "6-21-18",ref_num: 3456789765456787656}
    # Using the three_day_forecast variable defined above,
    # retrieve the expected piece of information

    # Original answer:
    # actual = three_day_forecast.fetch(:days).at(1).fetch(:high)

    # Additional answer:
    actual = 0
    three_day_forecast[:days].each do |k,v|
      if v = 55
        actual = v
      end
    end

    expected = 55
    expect(actual).to eq(expected)
  end

  it 'test 16' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},
    {high: 55,low: 47,summary: "Partly Cloudy"},
    {high: 77,low: 64,summary: "Sunny"}], 
    "date" => "6-21-18",ref_num: 3456789765456787656}
    # Using the three_day_forecast variable defined above,
    # retrieve the expected piece of information

    # Original answer:
    # actual = three_day_forecast.fetch(:days).at(0).keys

    # Additional answer:
    actual = three_day_forecast[:days][0].keys
  

    expected = [:high, :low, :summary]
    expect(actual).to eq(expected)
  end

  it 'test 17' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},
    {high: 55,low: 47,summary: "Partly Cloudy"},
    {high: 77,low: 64,summary: "Sunny"}], 
    "date" => "6-21-18",ref_num: 3456789765456787656}
    # Using the three_day_forecast variable defined above,
    # retrieve the expected piece of information

    actual = three_day_forecast.fetch(:days).at(-1).values
    expected = [77, 64, "Sunny"]
    expect(actual).to eq(expected)
  end

  it 'test 18' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},
    {high: 55,low: 47,summary: "Partly Cloudy"},
    {high: 77,low: 64,summary: "Sunny"}], 
    "date" => "6-21-18",ref_num: 3456789765456787656}
    # Using the three_day_forecast variable defined above,
    # retrieve the expected piece of information

    actual = three_day_forecast.keys.at(1)
    expected = "date"
    expect(actual).to eq(expected)
  end

  it 'test 19' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},
    {high: 55,low: 47,summary: "Partly Cloudy"},
    {high: 77,low: 64,summary: "Sunny"}], 
    "date" => "6-21-18",ref_num: 3456789765456787656}
    # Using the three_day_forecast variable defined above,
    # Change the high on the fist day to 99
    three_day_forecast.fetch(:days).at(0).store(:high, 99)

    expected = {days: [{high: 99,low: 63,summary: "Mostly Sunny"},
    {high: 55,low: 47,summary: "Partly Cloudy"},
    {high: 77,low: 64,summary: "Sunny"}], 
    "date" => "6-21-18",ref_num: 3456789765456787656}
    expect(three_day_forecast).to eq(expected)
  end

  it 'test 20' do
    three_day_forecast = {days: [{high: 70,low: 63,summary: "Mostly Sunny"},
    {high: 55,low: 47,summary: "Partly Cloudy"},
    {high: 77,low: 64,summary: "Sunny"}], 
    "date" => "6-21-18",ref_num: 3456789765456787656}
    # Using the three_day_forecast variable defined above,
    # Add a new key "time" with the value "12:30"
    three_day_forecast.store("time", "12:30")
    expected = {"time" => "12:30", days: [{high: 70,low: 63,summary: "Mostly Sunny"},{high: 55,low: 47,summary: "Partly Cloudy"},{high: 77,low: 64,summary: "Sunny"}], "date" => "6-21-18",ref_num: 3456789765456787656}
    expect(three_day_forecast).to eq(expected)
  end
end


