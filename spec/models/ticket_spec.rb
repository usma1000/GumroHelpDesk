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

  it "only shows tickets with priority true if priority scope is called" do
    ticket = FactoryGirl.create(:ticket)

    expect(Ticket.all.priority.count).to eq(0)
  end

  describe "status" do
    it "returns open if status is 0" do
      ticket = FactoryGirl.create(:ticket)

      expect(ticket.status).to eq("open")
    end

    it "returns waiting if status is 1" do
      ticket = FactoryGirl.create(:ticket, status: 1)

      expect(ticket.status).to eq("waiting")
    end

    it "returns done if status is 2" do
      ticket = FactoryGirl.create(:ticket, status: 2)

      expect(ticket.status).to eq("done")
    end

    it "returns trashed if status is 3" do
      ticket = FactoryGirl.create(:ticket, status: 3)

      expect(ticket.status).to eq("trashed")
    end
  end

end
