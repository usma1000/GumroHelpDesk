require 'rails_helper'

describe Carrier do
  it "has a valid factory" do
    expect(FactoryGirl.create(:carrier)).to be_valid
  end

  it "is invalid without a name" do
    carrier = FactoryGirl.build(:carrier, name: nil)

    expect(carrier).to_not be_valid
  end
end
