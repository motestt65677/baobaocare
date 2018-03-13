class ChatroomsController < ApplicationController
  def index
    if current_user.type == "Mother"
      @children = current_user.children
      @chatrooms = []
      
      @children.each do |child|

        byebug

        @chatrooms.push(child.chatrooms)        
      end
      byebug

    elsif current_user.type == "Doctor"
      
    else
      redirect_to login_in_path
    end
  end


  def show
    @chatroom = Chatroom.find(params[:id])
    @comment = Comment.new
    @comments = @chatroom.comments
  end
  
end
