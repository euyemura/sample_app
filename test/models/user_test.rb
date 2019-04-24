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
  end

  test "name should be present" do
    @user.name =  "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "names that are too long should be invalid" do
    @user.name = "h" * 51
    assert_not @user.valid?
    p "here are name length errors, #{@user.errors.full_messages}"
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org  first.last@foo.jp alice+bob@baz.cn]
    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "#{email.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_emails = %w{user@example,com user_at_foo.org user_@foo..org user.name@example. foo@bar_baz.com foo@bar+baz.com}
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email.inspect} should be invalid"
    end
  end

  test "should reject duplicate emails" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
    p duplicate_user.errors.messages
  end
end
