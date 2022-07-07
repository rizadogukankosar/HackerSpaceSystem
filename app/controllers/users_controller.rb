class UsersController < ApplicationController
  def show
		@user = User.find(params[:id])
    flash[:notice] = "YOUR MESSAGE"
	end
end
