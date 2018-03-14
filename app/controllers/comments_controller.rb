class CommentsController < ApplicationController
  def create


    @chat_room = Chatroom.find(params[:chatroom_id])
    comment = Comment.new(text: params[:text], chatroom_id: @chat_room.id, user_id: current_user.id)
    if comment.save
      ActionCable.server.broadcast 'room_channel',
                                   content:  comment.text,
                                   username: comment.user.first_name
    end
    # redirect_to chatroom_path(@chat_room)
  end

end
