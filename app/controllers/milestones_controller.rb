class MilestonesController < ApplicationController

  def index      
    @mother = Mother.find(params[:mother_id])
    @child = Child.find(params[:child_id])   
    @milestones = Milestone.all         
  end

  def new     
      @mother = Mother.find(params[:mother_id])
      @child = Child.find(params[:child_id]) 
      @milestones = Milestone.new
  end

  def create
    @mother = Mother.find(params[:mother_id])
    @child = Child.find(params[:child_id]) 
    @milestone_type = params[:milestone_type]
    @milestones = params[:milestones]
    @milestones.each do |milestone|
      @child.milestones.create(title: @milestone_type, description: milestone)      
    end
    redirect_to mother_child_milestones_path(@mother, @child)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def milestone_params
    params.require(:milestone).permit(:title, :description, :date, :child_id, :mother_id, :age_group, {documents: []})
  end
  
end
