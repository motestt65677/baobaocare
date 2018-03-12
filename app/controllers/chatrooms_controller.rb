class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end


  def show
    @chatroom = Chatroom.find(params[:id])
    @comment = Comment.new
    @comments = @chatroom.comments
  end
  
end
