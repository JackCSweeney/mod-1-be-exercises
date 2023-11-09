class Retirement
    def initialize
    end

    def calculate(num1, num2)
        if num1.negative? == true
            "Error. Age cannot be negative."
        else
            num = num2 - num1
            "You have #{num} years left until you can retire. It is 2015, so you can retire in #{2015 + num}."
        end
    end
end
        