require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get assets index" do
    get account_url
    assert_redirected_to new_user_session_url
  end

end
