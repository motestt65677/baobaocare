class MothersController < Clearance::UsersController
  def index
  end

  def create
    @mother = Mother.new(mother_params)
    
    if @mother.save
      sign_in @mother
      UserMailer.welcome_mother_email(@mother).deliver_now
      redirect_to mother_profile_path(@mother)
    else
      flash[:notice]
      redirect_to root_path, notice: @mother.errors.full_messages.join(', ')
    end
  end

  def show
    @mother = current_user
  end

  def homepage
    @mother = current_user
    # @chatrooms = @doctor.chatrooms
  end

  def edit
    @mother = current_user
    @child = Child.new
  end

  def update
    @mother = current_user
    @mother.update_attributes(mother_params)
    redirect_to mother_path(@mother)
  end

  def subscribe
  
  end

private
  def mother_params
    params.require(:mother).permit(:email, :password, :first_name, :last_name, :type, :avatar)
  end


end
