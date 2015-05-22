require 'test_helper'

class UserFriendshipsControllerTest < ActionController::TestCase
	context "#new" do
		context "when not logged in" do
			should "redirect to the login page" do
				get :new
				assert_response :redirect
			end
		end

		context "when logged in" do
			setup do
				user = User.create(first_name: "Mauricio", last_name: "Serna Flórez", email: "mauricioserf@hotmail.com", profile_name: "fmauricios")
				sign_in(user)
			end
			should "get new and return success" do
				get :new
				assert_response :success
			end
		end
	end

	context "#create" do
		context "when not logged in" do
			should "rediret to the login page" do
				get :new
				assert_response :redirect
				assert_redirected_to login_path
			end
		end
	end
end
