class ChatroomsController < ApplicationController
  def index
    if current_user.type == "Mother"
      @children = current_user.children
      @chatrooms = []
      
      @children.each do |child|
        @chatrooms.push(child.chatrooms)
      end

      @chatrooms = @chatrooms[0]

    elsif current_user.type == "Doctor"
      @chatrooms = current_user.chatrooms

    else
      redirect_to login_in_path
    end

    @children = Child.all
    end


  def show
    @chatroom = Chatroom.find(params[:id])
    @comment = Comment.new
    @comments = @chatroom.comments
    
  end
  
  
end
