class WelcomeController < ApplicationController
  def index
<<<<<<< HEAD
  	if current_user.nil? == false

    if current_user.type == "Mother"
      redirect_to mother_path(current_user)
    elsif current_user.type == "Doctor"
      redirect_to chatrooms_path
=======
    if signed_in?
      if current_user.type == "Mother"
        redirect_to mother_path(current_user)
      elsif current_user.type == "Doctor"
        redirect_to chatrooms_path
      end
>>>>>>> ec816e9e0a4fe25821331e467ddc6c244a923dd8
    end

  end
  end
end
