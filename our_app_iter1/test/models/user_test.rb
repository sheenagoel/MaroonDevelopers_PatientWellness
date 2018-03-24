require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", phone: "9827094529",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "phone should be present" do
    @user.phone = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "phone should not be too long" do
    @user.phone = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "phone validation should accept valid addresses" do
    valid_addresses = %w[1234567890 0987654321 9799851509 9799851508]
    valid_addresses.each do |valid_address|
      @user.phone = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "phone validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.phone = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "phone address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.phone = @user.phone.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
  
end
