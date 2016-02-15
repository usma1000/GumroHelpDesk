require 'rails_helper'

describe Store do
  it "has a valid factory" do
    expect(FactoryGirl.create(:store)).to be_valid
  end

  it "is invalid without a name" do
    store = FactoryGirl.build(:store, store: nil)

    expect(store).to_not be_valid
  end
end
