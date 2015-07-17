require 'rails_helper'

feature "Visits a page with questions" do
  scenario "and a question has recently been added to the database" do
    question = FactoryGirl.create(:question)
    visit "/questions"
    expect(page).to have_content(question.content)
  end
end