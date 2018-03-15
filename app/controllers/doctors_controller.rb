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
    @doctor = current_user

    @chatrooms = @doctor.chatrooms

  end

  def edit
    @doctor = current_user
  end

  def update
    @doctor = current_user
    @doctor.update_attributes(user_from_params)
    redirect_to doctor_path(@doctor)
  end


  def search
    @doctors =Doctor.all
      filtering_params(params).each do |key,value|          
        @doctors = @doctors.public_send(key,value) if value.present? 
        if @doctors.empty?
          flash[:notice] = "Sorry there are no matching results for your search!"
        end 
      end
  end
   

  private
  def user_from_params
    params[:doctor].permit(:email, :password, :first_name, :last_name, :type, :specialty, :experience_years,:location, :qualifications, :avatar)
  end

  def filtering_params(params)
    params.slice(:location, :speciality)
  end


end
