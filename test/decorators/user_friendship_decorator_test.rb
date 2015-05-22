require 'test_helper'

class UserFriendshipDecoratorTest < Draper::TestCase
	context "with a pending user friendship" do
		context "#friendship_state" do
			setup do
				@user_friendship = create(:pending_user_frienship)
				@decorator = UserFriendshipDecorator.decorate(@user_friendship)
			end
			should "return pending" do
				assert_equal "Pending" , @decorator.friendship_state
			end
		end
	end
end
