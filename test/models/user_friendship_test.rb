require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a friendship works without raising an exception" do
		assert_nothing_raised do
			user = User.create(first_name: "Jorge", last_name: "Serna", email: "jorgeserna@gmail.com", profile_name: "jorserna")
			friend = User.create(first_name: "Alba", last_name: "Florez", email: "luzalba@gmail.com", profile_name: "luzalba")
			UserFriendship.create user: user, friend: friend
		end
	end

	# test "that creating a friendsip based on user id and friend id works" do
	# 		user = User.create(first_name: "Jorge", last_name: "Serna", email: "jorgeserna@gmail.com", profile_name: "jorserna")
	# 		friend = User.create(first_name: "Alba", last_name: "Florez", email: "luzalba@gmail.com", profile_name: "luzalba")
	# 		UserFriendship.create user_id: user.id, friend_id: friend.id
	# 		assert user.friends.include?(friend)
	# 	end
end
