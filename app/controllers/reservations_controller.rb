class ReservationsController < ApplicationController
  
  def index
    # @reservations = Reservation.all

    @children = current_user.children
      @chatrooms = []
      @children.each do |child|
        child.chatrooms.each do |room|
          @chatrooms.push(room)
        end
      end

    @reservations = []
    @chatrooms.each do |chatroom|
        chatroom.reservations.each do |reservation|
          @reservations.push(reservation)
      end
    end


  end

  def create
  
    @chatroom = Chatroom.find(params[:id])
    @reservation = @chatroom.reservations.new(reservation_params)
    if @reservation.save 
      new_chatroom_path(@chatroom)

    else

      "error"

    end

  end


  # def edit
  # end

  # def update
  # end 

  # def destroy
  # end

  # private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :start_time, :end_time)
  end


end
