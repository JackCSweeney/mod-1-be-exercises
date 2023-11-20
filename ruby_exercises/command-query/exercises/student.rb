class Student
    def initialize
        @grade = 'C'
        @study_count = 0
    end

    def study
        if @study_count <= 1
        @study_count += 1
        end
    end
    
    def grade
        if @study_count == 0
            @grade = 'C'
        elsif
            @study_count == 1
            @grade = 'B'
        elsif
            @study_count == 2
            @grade = 'A'
        elsif
            @study_count == -1
            @grade = 'D'
        elsif 
            @study_count == -2
            @grade = 'F'
        end
    end

    def slack_off
        if @study_count >= -1
            @study_count -= 1
        end
    end
end
        