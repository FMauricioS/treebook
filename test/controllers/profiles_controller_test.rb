require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
  	user = User.new(first_name: 'Mauricio', last_name: 'Serna', email: 'mauricioserf@hotmail.com')
		user.password = user.password_confirmation = 'asdfasdf'
		user.profile_name = 'fmauricios'
    get :show, id: user.profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

end
