require 'test_helper'

class UserTest < ActiveSupport::TestCase
	should have_many(:user_friendships)
	should have_many(:friends)
	test "a user should enter a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

	test "a user should enter a last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	test "a user should enter a profile name" do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a uniquennes profile_name" do
		user = User.new
		!user.save
		assert user.errors[:profile_name]
	end

	test "a user should have a profile name without spaces" do
		user = User.new(first_name: 'Mauricio', last_name: 'Serna', email: 'mauricioserf@hotmail.com')
		user.password = user.password_confirmation = 'asdfasdf'
		user.profile_name = "My profile with spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	test "a user can have a correctly formatted profile name" do
		user = User.new(first_name: 'Mauricio', last_name: 'Serna', email: 'mauricioserf@hotmail.com')
		user.password = user.password_confirmation = 'asdfasdf'
		user.profile_name = 'fmauricios_1'
		assert user.valid?
	end

	test "that no error is raised when trying to access a friend list" do
		user = User.create(first_name: "Jorge", last_name: "Serna", email: "jorgeserna@gmail.com", profile_name: "jorserna")
		friend = User.create(first_name: "Alba", last_name: "Florez", email: "luzalba@gmail.com", profile_name: "luzalba")
		assert_nothing_raised do
			user.friends(friend)
		end
	end

	test "that creating friendships on a user works" do
		user = User.create(first_name: "Jorge", last_name: "Serna", email: "jorgeserna@gmail.com", profile_name: "jorserna")
		friend = User.create(first_name: "Alba", last_name: "Florez", email: "luzalba@gmail.com", profile_name: "luzalba")
		user.friends << friend
		user.friends.reload
		assert user.friends.include?(friend)
	end

end
