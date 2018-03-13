class MothersController < Clearance::UsersController
  def index
  end

  def create
    @mother = Mother.new(mother_params)
    if @mother.save
      sign_in @mother
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def show
    @mother = Mother.find(params[:id])
  end

  def edit
    @mother = Mother.find(params[:id])
    @child = Child.new
  end

  def update
    @mother = Mother.find(params[:id])
    @mother.update_attributes(mother_params)
    redirect_to edit_mother_path(@mother)
  end

private
  def mother_params
    params.require(:mother).permit(:email, :password, :first_name, :last_name, :type)
  end


end
