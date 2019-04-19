require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'example_user@test.com')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should be invalid for an empty user" do
    empty_user = User.new
    assert_not empty_user.valid?
    p "here is the empty user #{empty_user}"
  end

  test "name should be present" do
    @user.name =  "     "
    assert_not @user.valid?
    p "here are name errors #{@user.errors.full_messages}"
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
    p "here are email errors #{@user.errors.full_messages}"
  end
end
