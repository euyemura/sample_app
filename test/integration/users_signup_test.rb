require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    puts "TESTING AN INVALID USER"
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name: "", email: "user@invalid", password: "foo", password_confirmation: "bar"} }
    end
    assert_template 'users/new'
    assert_select "div#error_explanation div.alert", "The form contains 4 errors."
    assert_select 'div.field_with_errors'
  end

  test "valid sign up information" do
    puts "TESTING A VALID USER!"
    get signup_path
    assert_difference 'User.count', 1 do
      post signup_path, params: {user: {name: "Widowmaker", email: "oneshot@talon.com", password: "foobar", password_confirmation: "foobar"}}
    end
    follow_redirect!
    assert_template "users/show"
    # assert_select "div.alert-success"
    puts flash
    assert_not flash.empty?
  end

end
