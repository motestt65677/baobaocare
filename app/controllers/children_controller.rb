class ChildrenController < ApplicationController
  def create
    year = params[:children]["birthday(1i)"]
    month = params[:children]["birthday(2i)"]
    day = params[:children]["birthday(3i)"]
    birthday = "#{day}-#{month}-#{year}"

    @mother = current_user
    @child = @mother.children.new(child_params)
    @child[:birthday] = birthday
    @child.save
    
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
    # params[:post].assert_valid_keys( 'birthday(1i)', 'birthday(2i)', 'birthday(3i)')

  end


end
