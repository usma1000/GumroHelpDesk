require 'rails_helper'
include Warden::Test::Helpers

describe "the log in process" do
  it "when visiting root, it redirects to login page if not logged in" do
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
