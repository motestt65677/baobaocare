class ChatroomsController < ApplicationController
  def index
    if current_user.type == "Mother"
      @children = current_user.children
      @chatrooms = []
      @children.each do |child|
        child.chatrooms.each do |room|
          @chatrooms.push(room)
        end        
      end
    elsif current_user.type == "Doctor"
      @chatrooms = current_user.chatrooms
    else
      redirect_to login_in_path
    end

    @children = Child.all
  end


  def show
    @chatroom = Chatroom.find(params[:id])
    @timeslots = @chatroom.doctor.timeslots
    @doctor = @chatroom.doctor
    @child = @chatroom.child

    if current_user.type == "Mother"
      @child = @chatroom.child
      if current_user.children.includes(@child)
        @comment = Comment.new
        @comments = @chatroom.comments.includes(:user)
      end
    elsif current_user.type == "Doctor"
      if current_user.chatrooms.includes(@chatroom)
          @chatroom = Chatroom.find(params[:id])
          @comment = Comment.new
          @comments = @chatroom.comments.includes(:user)
      end
    end
  end

  def create
    Chatroom.create(doctor_id: params[:doctor_id], child_id: params[:child_id])
    redirect_to chatrooms_path
  end
  
  
end
