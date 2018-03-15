class ChildrenController < ApplicationController
  def create
    @mother = current_user
    @mother.children.create(child_params)
    redirect_to mother_path(@mother)
  end

  def show
    @mother = current_user
    @child = @mother.children.find(params[:id])
  end
  
  def edit
    @mother = current_user
    @child = @mother.children.find(params[:id])
  end
  
  def update
    @mother = current_user
    @child = @mother.children.find(params[:id])
    @child.avatar = params[:file]
    @child.update(child_params)
    
    redirect_to mother_child_path(@mother, @child)
  end
  
  def destroy
    @mother = current_user
    @child = @mother.children.find(params[:id])
    if @child.destroy
      redirect_to mother_path(@mother)
    end
  end
  
  private
  def child_params
    params.require(:child).permit(:name, :birthday, :avatar)
  end
end
