class CommentsController < ApplicationController
  def create
    @chat_room = Chatroom.find(params[:chatroom_id])
    comment = Comment.new(text: params[:text], chatroom_id: @chat_room.id, user_id: current_user.id)
    
    if comment.save
      if current_user.type == "Doctor"
        ActionCable.server.broadcast "room_channel_#{params[:chatroom_id]}",
                                     user_message:  user_message(comment),
                                     other_message: doctor_message(comment),
                                     username: comment.user.first_name,
                                     chatroom_id: params[:chatroom_id]
      elsif current_user.type == "Mother"
        ActionCable.server.broadcast "room_channel_#{params[:chatroom_id]}",
                                     user_message:  user_message(comment),
                                     other_message: mother_message(comment),
                                     username: comment.user.first_name,
                                     chatroom_id: params[:chatroom_id]
      end
    end

    # redirect_to chatroom_path(@chat_room)
  end
  private

  def mother_message(comment)
    ApplicationController.render(partial: 'comments/mother_comment', locals: { comment: comment })
  end
  def doctor_message(comment)
    ApplicationController.render(partial: 'comments/doctor_comment', locals: { comment: comment })
  end
  def user_message(comment)
    ApplicationController.render(partial: 'comments/user_comment', locals: { comment: comment })
  end
end
