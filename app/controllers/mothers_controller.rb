class MothersController < ApplicationController
  def index
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
    params.require(:mother).permit(:first_name, :last_name, :email)
  end
end
