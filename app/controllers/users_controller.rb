class UsersController < Clearance::UsersController


  def new
    @mother= Mother.new
    @doctor= Doctor.new
    
    render template: "users/new"
  end


  # def create
  #   @user = User.new(user_from_params)
  #   if @user.save
  #     sign_in @user
  #     redirect_back_or url_after_create
  #   else
  #     render template: "users/new"
  #   end
  # end





  # private

  # def user_from_params
  #   params[:user].permit(:email, :password, :first_name, :last_name, :type)
  # end


end