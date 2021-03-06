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

  context "a new instance" do
    setup do
      user = User.create(first_name: "Jorge", last_name: "Serna", email: "jorgeserna@gmail.com", profile_name: "jorserna")
      friend = User.create(first_name: "Alba", last_name: "Florez", email: "luzalba@gmail.com", profile_name: "luzalba")

      @user_friendship = UserFriendship.create user: user, friend: friend
    end

    should "have a pending state" do
      assert_equal 'pending', @user_friendship.state
    end
  end

  context "#send_request_email" do
    setup do
      assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      	@user_friendship.send_request_email
      end

    end
  end
end
