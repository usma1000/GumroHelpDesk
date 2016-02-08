require 'rails_helper'

describe Ticket do
  it "has a valid factory" do
    expect(FactoryGirl.create(:ticket)).to be_valid
  end

  it "is invalid without a subject" do
    ticket = FactoryGirl.build(:ticket, subject: nil)

    expect(ticket).to_not be_valid
  end

  it "is invalid without a content" do
    ticket = FactoryGirl.build(:ticket, content: nil)
    
    expect(ticket).to_not be_valid
  end
end
