require 'rails_helper'
include Warden::Test::Helpers

feature "manage tickets" do
  scenario "user clicks on new ticket button and sees the new ticket form" do
    sign_in
    first(:link, "New Ticket").click #There are two New Ticket buttons, so I specified that the first link is clicked
    expect(page).to have_content "New Ticket"
  end

  scenario "user creates new ticket and it shows up in the table" do
    sign_in
    create_ticket
    visit '/'
    should_see_ticket
  end

  scenario "only see tickets created by users with the same carrier_id" do
    sign_in
    create_ticket(subject: "Created by Carrier 1")
    sign_in(email: "test2@test.com", carrier_id: 2)
    should_not_see_ticket_with_subject "Created by Carrier 1"
  end
end

########## Helper Methods

def sign_in(email="test@test.com", carrier_id=1)
  user = User.create(email: email, password: "password", first_name: "John", last_name: "Doe", carrier_id: carrier_id)
  login_as user
  visit "/"
end

def create_ticket(subject: "subject", content: "content")
  visit new_ticket_path
  fill_in 'ticket_subject', with: subject
  fill_in 'ticket_content', with: content
  click_on "Create Ticket"
end

def should_see_ticket(subject: "subject")
  within "table" do
    expect(page).to have_css "tr", text: subject
  end
end

def should_not_see_ticket_with_subject(subject)
  within "table" do
    expect(page).not_to have_css 'tr', text: subject
  end
end
