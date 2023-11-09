class EscapeCharacters
    def initialize
    end

    def quote(string)
        string.insert(0, "\"").insert(-1, "\"")
    end
end
