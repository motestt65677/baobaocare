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

  def index
    @doctors = Doctor.all
    @doctors = Doctor.order(:first_name).page params[:page]
  end

  def show #public show page
    @doctor = Doctor.find(params[:id])
  end

  def homepage
    @doctor = Doctor.find(params[:id])

    @chatrooms = @doctor.chatrooms
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update_attributes(user_from_params)
    redirect_to doctor_path(@doctor)
  end


  private
  def user_from_params
    params[:doctor].permit(:email, :password, :first_name, :last_name, :type, :specialty, :experience_years,:location, :qualifications)
  end

end
