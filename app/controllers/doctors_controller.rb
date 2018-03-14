class DoctorsController < Clearance::UsersController

  def create
    @doctor = Doctor.new(user_from_params)

    if @doctor.save
      sign_in @doctor
      UserMailer.welcome_doctor_email(@doctor).deliver_now
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  private
  def user_from_params
    params[:doctor].permit(:email, :password, :first_name, :last_name, :type)
  end


end
