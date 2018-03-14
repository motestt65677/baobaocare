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

  
end

  
