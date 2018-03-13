class MilestonesController < ApplicationController

  def index      
    @mother = User.find(params[:mother_id])
    @child = Child.find(params[:child_id])   
    @milestones = Milestone.all         
  end

  def new     
      @mother = User.find(params[:mother_id])
      @child = Child.find(params[:child_id]) 
      @milestones = Milestone.new
  end

  def create
    @mother = User.find(params[:mother_id])
    @child = Child.find(params[:child_id]) 
    @milestones = milestones.new(milestone_params)
    if @milestones.save
      redirect to mother_child_milestones(@mother, @child, @milestones)
    end
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
