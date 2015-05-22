require 'test_helper'

class AddAFriendTest < ActionDispatch::IntegrationTest
  def sign_in_as(user, password)
	  	post login_path, user: { email: user.email, password: password }
	end

	test "that adding a friend works" do
		user = User.create(first_name: "Mauricio", last_name: "Serna Flórez", email: "mauricioserf@hotmail.com", profile_name: "fmauricios", encrypted_password: "$2a$10$FqNujze0YJOmKUOeUYzBy.MDqTat3jCJcq2M4va0NqMrtA2WSH5.W")
		sign_in_as user, "testing"
		get "/user_friendships/new?friend_id=#{user.profile_name}"
		assert_response :success
	end
end
