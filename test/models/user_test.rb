require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "username should not be blank" do
    user = User.new
    assert_not user.save, "Created user without username"
  end

  test "password should not be blank" do
    user = User.new
    assert_not user.save, "Created user without password"
  end

  test "email should be in valid format" do
    user = User.new
    assert_match (user.email, /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, "Valid email")
  end

  test "password_confirmation should not be blank" do
    user = User.new
    assert_not user.save, "Created user without password confirmation"
  end

  # test "the truth" do
  #   assert true
  # end
end
