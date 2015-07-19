require 'rails_helper'

feature "Visits a page with questions" do
  scenario "after a question has recently been added to the database" do
    question = FactoryGirl.create(:question)
    topic = FactoryGirl.create(:topic)
    question.topic_id = topic.id
    question.save

    visit "/topics/#{topic.slug}"
    expect(page).to have_content(question.content)
  end
end

feature "Update a question" do
  let!(:topic) { create(:topic) }
  let!(:question) { create(:question) }

  scenario "by changing its content" do
    question.topic_id = topic.id
    question.save
    question.update_attributes(content: "Kalamazoo")

    visit "/topics/#{topic.slug}"
    expect(page).to have_content("Kalamazoo")
  end

  scenario "by giving it an answer" do
    question.topic_id = topic.id
    question.save
    question.update_attributes(answer: "Michigan")

    visit "/topics/#{topic.slug}"
    expect(page).to have_content("Michigan")
  end
end

feature "Delete a question" do
  scenario "from its topic page" do
    question = FactoryGirl.create(:question)
    topic = FactoryGirl.create(:topic)
    question.topic_id = topic.id
    question.save

    question.destroy

    visit "/topics/#{topic.slug}"
    expect(page).not_to have_content(question.content)
  end
end