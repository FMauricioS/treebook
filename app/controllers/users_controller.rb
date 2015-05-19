class UsersController < ApplicationController::Base
	def create
		@user = current_user.create(user_params)
	end

	def update
		@user = current_user.find(params[:id])
		@user = current_user.update_attributes!(user_params)
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :profile_name).merge(:friend_id)
	end
end