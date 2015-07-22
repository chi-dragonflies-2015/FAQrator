require 'rails_helper'

feature "User visits the website" do
  scenario "when user signs up" do
    user = FactoryGirl.create(:user)
    visit "/users/new"
    fill_in "user[first_name]", with: user.first_name
    fill_in "user[last_name]", with: user.last_name
    fill_in "user[username]", with: user.username
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "Sign Up"
    expect(page).to have_content("Log Out")
  end

  scenario "when user logs in" do
    user = FactoryGirl.create(:user)
    visit "/sessions/new"
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_button "Log In"
    expect(page).to have_content("Log Out")
  end

  scenario "when user logs out" do
    user = FactoryGirl.create(:user)
    visit "/sessions/new"
    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: user.password
    click_button "Log In"
    expect(page).to have_content("Log Out")
    click_link "Log Out"  
    expect(page).to have_content("Log In")
  end




end