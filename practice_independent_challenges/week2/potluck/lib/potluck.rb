class Potluck

    attr_reader :date

    def initialize(date)
        @date = date
        @dishes = []
    end
end