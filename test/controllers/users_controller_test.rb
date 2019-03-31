require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  test "should get new" do
    puts "testing the sign up page"
    get signup_path
    assert_response :success
    puts "title should be #{full_title('Sign up')}"
    assert_select "title", full_title('Sign up')
  end

end
