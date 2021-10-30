require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get accounts_login_url
    assert_response :success
  end

  test "should get signup" do
    get accounts_signup_url
    assert_response :success
  end

end
