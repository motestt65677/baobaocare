class ChildrenController < ApplicationController
  def create
    @mother = Mother.find(params[:mother_id])
    @mother.children.create(child_params)
    redirect_to edit_mother_path(@mother)
  end

  def show
    @mother = Mother.find(params[:mother_id])
    @child = @mother.children.find(params[:id])
  end
  
  def edit
    @mother = Mother.find(params[:mother_id])
    @child = @mother.children.find(params[:id])
  end
  
  def update
    @mother = Mother.find(params[:mother_id])
    @child = @mother.children.update(child_params)
    redirect_to mother_child_path(@mother, @child)
  end
  
  private
  def child_params
    params.require(:child).permit(:name, :birthday)
  end
end
