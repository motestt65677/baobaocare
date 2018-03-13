class DoctorsController < Clearance::UsersController

  def create
    @doctor = Doctor.new(user_from_params)

    if @doctor.save
      sign_in @doctor
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def index
    @doctors =Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  # def update
  #   @doctor = Doctor.find(params[:id])
  #   @doctor.update_attributes(user_from_params)
  #   redirect_to edit_mother_path(@doctor)
  # end


  private
  def user_from_params
    params[:doctor].permit(:email, :password, :first_name, :last_name, :type)
  end

end
