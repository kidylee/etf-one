require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  
  # include Devise::Test::ControllerHelpers
  
  

  test "should get login page" do
    get account_url
    assert_redirected_to new_user_session_url
  end
  
   test "should get assets index" do
    sign_in User.new(email: "test@example.org",password:  "123greetings")
    get account_url
    assert_response :success
  end

end
