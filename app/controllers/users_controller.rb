class UsersController < Clearance::UsersController

  def new
    @mother= Mother.new
    @doctor= Doctor.new
    render template: "users/new"
  end


end