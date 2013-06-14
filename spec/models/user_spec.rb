require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user.username = nil
    expect(user).to_not be_valid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).to_not be_valid
  end

  it "is invalid without an email" do
    user.email = nil
    expect(user).to_not be_valid
  end
end
