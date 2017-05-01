require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup user" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
       email: "user@invalid",
       password:              "foo",
       password_confirmation: "bar" } }
     end
     assert_template 'users/new'
     assert_select 'div.alert'

   end

   test "valid signup user" do
    get signup_path
    assert_difference 'User.count' do
      post users_path, params: { user: { name:  "example",
       email: "example@tutorial.com",
       password:              "hellohello",
       password_confirmation: "hellohello" } }
     end
     follow_redirect!
     assert_template 'users/show'
     assert_select 'div.alert', "Welcome to the Sample App!"
   end



 end
