require 'rails_helper'

feature "User visits the website" do
    scenario "when user visits the homepage" do
    topic = build(:topic)
    visit '/'
    fill_in('topic[title]', :with => topic.title)
    fill_in('topic[description]', :with => topic.description)
    click_button 'submit'
    expect(page).to have_field('Title', with: topic.title)
    expect(page).to have_content(topic.description)
  end

  scenario "when user visits topics#index" do
    topic = create(:topic)
    visit '/topics'
    expect(page).to have_content(topic.title)
    expect(page.has_link?(topic.title)).to be true
  end
end

feature "User posts a new topic" do
  scenario "when user visits the topics#new" do
    visit 'topics/new'
    expect(page).to have_selector("input[name='topic[title]']")
    expect(page).to have_selector("textarea[name='topic[description]']")
  end

  scenario "when user posts a new topic through topics#new" do
    topic = build(:topic)
    visit 'topics/new'
    fill_in('topic[title]', :with => topic.title)
    fill_in('topic[description]', :with => topic.description)
    click_button 'submit'
    expect(page).to have_field('Title', with: topic.title)
    expect(page).to have_content(topic.description)
  end
end