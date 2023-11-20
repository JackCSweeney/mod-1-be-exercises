class Santa
    def initialize
        @fits = true
        @cookie_count = 0
    end

    def fits?
        @fits
    end

    def eats_cookies
        @cookie_count += 1
        if @cookie_count > 2
            @fits = false
        end
    end
end