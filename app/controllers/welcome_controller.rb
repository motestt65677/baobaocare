class WelcomeController < ApplicationController
  def index
    if signed_in?
      if current_user.type == "Mother"
        redirect_to mother_path(current_user)
      elsif current_user.type == "Doctor"
        redirect_to chatrooms_path
      end
    end
  end
  end

