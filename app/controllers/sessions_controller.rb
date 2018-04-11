class SessionsController < Clearance::SessionsController
  def guest
    sign_in(User.find_by_first_name("Guest"))
    redirect_to "/"
  end
end