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
    @reservations = @chatroom.reservations
    @doctor = @chatroom.doctor
    @child = @chatroom.child
    @mother = @child.mother

    if current_user.nil? && params[:id]==21
      sign_in(User.find_by_first_name("Guest"))
      return
    end

    if current_user.type == "Mother"
      @child = @chatroom.child
      if current_user.children.includes(@child)
        @comment = Comment.new
        @comments = @chatroom.comments.includes(:user).order(:created_at)
      end
    elsif current_user.type == "Doctor"
      if current_user.chatrooms.includes(@chatroom)
        @chatroom = Chatroom.find(params[:id])
        @comment = Comment.new
        @comments = @chatroom.comments.includes(:user).order(:created_at)
      end
    end
  end

  def destroy 
    @chatroom = Chatroom.find(params[:id])
    @child = @chatroom.child
    @mother = @child.mother

    if current_user.children.includes(@child)
      Chatroom.delete(@chatroom)
      flash[:sucess] = "Your chatroom has been deleted"
      redirect_to chatrooms_path
    else
      flash[:notice] = "you are not allowed to perform this action."
      redirect_to chatrooms_path 
    end 
  end

  def create
    Chatroom.create(doctor_id: params[:doctor_id], child_id: params[:child_id])
    redirect_to chatrooms_path
  end

  def search
    @chatroom = Chatroom.find(params[:chatroom_id])
    @doctor = @chatroom.doctor
    @timeslots = @doctor.timeslots 

    @timeslots = @timeslots.where(start_date: params[:start_date])

    respond_to do |format|
      format.js
    end
  end
  
  
end
