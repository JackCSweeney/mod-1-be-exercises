class SimpleMath
    def initialize
    end

    def add(num1,num2)
        num1 + num2
    end

    def subtract(num1,num2)
        num1 - num2
    end

    def multiply(num1,num2)
        num1 * num2
    end

    def divide(num1,num2)
        if num1 % num2 == 0
            num1 / num2
        else
            num1.to_f / num2.to_f
        end
    end
end