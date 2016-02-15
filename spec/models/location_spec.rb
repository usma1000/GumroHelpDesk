require 'rails_helper'

describe Location do
  it "has a valid factory" do
    expect(FactoryGirl.create(:location)).to be_valid
  end

  it "is invalid without a name" do
    location = FactoryGirl.build(:location, name: nil)

    expect(location).to_not be_valid
  end
end
