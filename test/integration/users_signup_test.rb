require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                          email: "user@ii",
                                          password:              "pass",
                                          password_confirmation: "word" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "koich",
                                          email: "example@railstutorial.org",
                                          password:              "koichi",
                                          password_confirmation: "koichi" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end
