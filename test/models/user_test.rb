require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test 'invalid user' do
    user = User.new(name: 'John', email: 'john@example.com')
    assert user.invalid?
  end
  test 'invalid without email' do
    user = User.new(name: 'John')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end
  # test "the truth" do
  #   assert true
  # end
end
