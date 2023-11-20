class Appointments
    def initialize
        @appointments = []
    end

    def earliest
        sorted_appointments = @appointments.sort_by do |time|
            time
        end
        sorted_appointments[0]
        
    end 

    def at(time)
        @appointments << time
    end
end

