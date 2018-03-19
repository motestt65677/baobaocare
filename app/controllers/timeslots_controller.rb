class TimeslotsController < ApplicationController
    def index
        @doctor = current_user
        @timeslot = @doctor.timeslots


        @reservations = []
        @chatrooms = @doctor.chatrooms
         @chatrooms.each do |chatroom|
            chatroom.reservations.each do |reservation|
              @reservations.push(reservation)
          end
        end

    end
    
    
    def create
        byebug
        @timeslot = Timeslot.new(timeslot_params)
        @timeslot.end_date = @timeslot.start_date
        @timeslot.doctor_id = current_user.id
        
        if params["Duration"] == "30 Minutes"
            @timeslot.end_time = @timeslot.start_time+ 30.minutes
         elsif params["Duration"] == "1 Hour"
            @timeslot.end_time = @timeslot.start_time+ 60.minutes
        end 

        
        if @timeslot.save
            redirect_to '/timeslots'
        else
            flash[:notice]
            redirect_to '/timeslots/new', notice: 'something went wrong, please enter again'
        end
    end
    
    def destroy
        @timeslot = Timeslot.find(params[:id])
        @timeslot.destroy
        if @timeslot.destroy
          redirect_to timeslots_path
        end
    end
    
    private
        def timeslot_params
            params.require(:timeslots).permit(:start_date, :end_date, :start_time, :end_time, :duration)
        end
end
