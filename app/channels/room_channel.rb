class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:room]}"
  end

  def unsubscribed
    p "unsubscribed"
    # Any cleanup needed when channel is unsubscribed
  end


end
