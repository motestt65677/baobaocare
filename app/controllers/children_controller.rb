class ChildrenController < ApplicationController
  def create
    @mother = Mother.find(params[:mother_id])
    @mother.children.create(child_params)
    redirect_to edit_mother_path(@mother)
  end

  private
  def child_params
    params.require(:child).permit(:name, :birthday)
  end
end
