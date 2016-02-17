require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end

  it "is invalid without a password" do
    expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
  end

  it "is invalid if two emails are the same" do
    FactoryGirl.create(:user, email: "unique@email.com")
    expect(FactoryGirl.build(:user, email: "unique@email.com")).to_not be_valid
  end

  context "full_name" do
    it "returns a user's full name as a string if both names are present" do
      user = FactoryGirl.create(:user, first_name: "John", last_name: "Doe")
      expect(user.full_name).to eq("John Doe")
    end

    it "returns user email if both names are nil" do
      user = FactoryGirl.create(:user, first_name: nil, last_name: nil, email: "test@test.com")
      expect(user.full_name).to eq("test@test.com")
    end

    it "returns only the first name if the last name is nil" do
      user = FactoryGirl.create(:user, first_name: "John", last_name: nil)
      expect(user.full_name).to eq("John")
    end

    it "returns only the last name if the first name is nil" do
      user = FactoryGirl.create(:user, first_name: nil, last_name: "Doe")
      expect(user.full_name).to eq("Doe")
    end
  end

end
