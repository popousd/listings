require 'test_helper'

describe User do
  before do
    @user =  users(:seller)
  end

  it "returns false if role != admin" do
    assert_equal false , @user.is_admin?
  end

  it "returns fullname" do
    assert_equal "John Doe", @user.full_name
  end

end
