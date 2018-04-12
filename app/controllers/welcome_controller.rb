class WelcomeController < ApplicationController
  def index
    if signed_in?
      if current_user.type == "Mother"
        redirect_to mother_profile_path(current_user)
      elsif current_user.type == "Doctor"
        redirect_to doctor_profile_path(current_user)
      end
    end
  end
  def chat
    sign_in(User.find_by_first_name("Guest"))
    redirect_to chatroom_path(Chatroom.find(21))
  end

  
end

  
