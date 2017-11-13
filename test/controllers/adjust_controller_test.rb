require 'test_helper'

class AdjustControllerTest < ActionDispatch::IntegrationTest
  test "should get index to sign_in" do
    get adjust_index_url
    assert_redirected_to new_user_session_url
  end
  
  test "should get edit if not sign in" do
    get adjust_edit_url
    assert_redirected_to new_user_session_url
  end

  test "should get index" do
    sign_in User.new(email: "test@example.org",password:  "123greetings")
    get adjust_index_url
    assert_response :success
    assert_select "a[href=?]", adjust_edit_path(email: "test@example.org")
  end
  
   test "should get edit" do
    sign_in User.new(email: "test@example.org",password:  "123greetings")
    get adjust_edit_url email: "test@example.org"
    assert_response :success
    assert_select "a[href=?]", adjust_show_path(asset: "BTC", email: "test@example.org")
  end
end
