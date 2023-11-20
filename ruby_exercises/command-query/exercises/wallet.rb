class Wallet
    def initialize
        @cents = []
    end

    def <<(money)
        @cents << money
    end

    def cents
        if @cents.length == 0
            @cents = 0
        else
            pennies = @cents.count do |money|
                money == :penny
            end
            nickels = @cents.count do |money|
                money == :nickel
            end
            dimes = @cents.count do |money|
                money == :dime
            end
            quarters = @cents.count do |money|
                money == :quarter
            end
            pennies + (nickels * 5) + (dimes * 10) + (quarters * 25)
        end
    end
    def take(*money)
        @cents.
    end
end