require "spec_helper"

describe User do
  context "User Attributes" do
    it { should respond_to :email }
    it { should respond_to :password }
    it { should respond_to :rants }
    it { should respond_to :responses }
  end

  it "Valid Users are saved to the database" do
    user = User.create(email: "test@test.com", password:"password")
    user.email.should eq "test@test.com"
    user.password.should eq "password"
  end

  it "Invalid emails should not be allowed" do
    user = User.new(email: "testtest.com", password:"password")
    user.should_not be_valid
  end

  it "Duplicate emails should not be allowed" do
    user_1 = User.create(email: "test@test.com", password:"password")
    user_2 = User.new(email: "test@test.com", password:"password")
    user_2.should_not be_valid
  end

  it "User.authenticate should return a user if creditentials valid" do
    user = User.create(email: "test@test.com", password:"password")
    test_user = User.authenticate(user.email, user.password)
    test_user.should_not be_nil
  end

  it "User.authenticate should return nil if creditentials invalid" do
    user = User.create(email: "test@test.com", password:"password")
    test_user = User.authenticate(user.email, user.password + "extra")
    test_user.should be_nil
  end


end
