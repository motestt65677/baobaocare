class TimeslotsController < ApplicationController
    def index
        @doctor = current_user
        @timeslot = @doctor.timeslots
    end
    
    
    def create
        @timeslot = Timeslot.new(timeslot_params)
        @timeslot.doctor_id = current_user.id
        
        if @timeslot.save
            redirect_to '/timeslots'
        else
            flash[:notice]
            redirect_to '/timeslots/new', notice: 'something went wrong, please enter again'
        end
    end
    
    def edit
        
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    def timeslot_params
        params.require(:timeslots).permit(:start_date, :end_date, :start_time, :end_time)
    end
end
