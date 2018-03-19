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
    @timeslot = Timeslot.find(params[:timeslot_id])
    @reservation = @chatroom.reservations.new({
      start_date: @timeslot.start_date,
      end_date: @timeslot.end_date, 
      start_time: @timeslot.start_time, 
      end_time: @timeslot.end_time,
      status: "pending"
    })

    if @reservation.save 
      redirect_to chatroom_path(@chatroom)
      flash[:success] = "reservation successful, waiting for docotr's confirmation"
    else
      redirect_to chatroom_path(@chatroom)
      flash[:notice] = "reservation unsuccessful"
    end

  end


  # def edit
  # end

  # def update
  # end 

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to mothers_reservations_path(current_user)
    end
  end




  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :start_time, :end_time)
  end


end
