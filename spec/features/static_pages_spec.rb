require 'rails_helper'

feature "User visits the website" do
  scenario "when user visits the root" do
    visit '/'
    expect(page).to have_css("#new_topic")
  end

  scenario "when user visits the root" do
    visit '/help'
    expect(page).to have_content("Help Page")
  end

  scenario "when user visits the root" do
    visit '/about'
    expect(page).to have_content("About Page")
  end
end