require 'rails_helper'
include Warden::Test::Helpers

describe "the log in process" do
  it "redirects to login page" do
    visit '/'

    expect(page).to have_content('Log In')
  end

  it "logs in after filling out login form" do
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on "Log in"

    expect(page).to have_content "Welcome back!"
  end

  it "logs out after clicking log out button" do
    user = FactoryGirl.create(:user)
    login_as user, scope: :user
    visit '/'
    click_on "Logout"

    expect(page).to have_content "Goodbye!"
  end
end

describe "the new ticket process", :type => :feature do
  before :each do
    @user = FactoryGirl.create(:user)
    login_as @user, :scope => :user
  end

  it "takes me to new ticket form when I click new ticket button" do
    visit '/'
    first(:link, "New Ticket").click

    expect(page).to have_content "New Ticket"
  end

  it "creates a new ticket when form is filled out" do
    visit new_ticket_path
    ticket = FactoryGirl.build(:ticket)
    fill_in 'ticket_subject', with: ticket.subject
    fill_in 'ticket_content', with: ticket.content
    click_on "Create Ticket"

    expect(page).to have_content "Ticket was successfully created."
  end

end
