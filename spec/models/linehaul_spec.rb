require 'rails_helper'

describe Linehaul do
  it "has a valid factory" do
    expect(FactoryGirl.create(:linehaul)).to be_valid
  end

  it "is invalid without a name" do
    linehaul = FactoryGirl.build(:linehaul, route: nil)

    expect(linehaul).to_not be_valid
  end
end
