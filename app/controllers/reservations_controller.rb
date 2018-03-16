class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def create
    
  end


  def edit
  end

  def update
  end 

  def destroy
  end

  private

  def reservation_params
    params.require(:booking).permit(:start_date, :end_date)
  end


end
