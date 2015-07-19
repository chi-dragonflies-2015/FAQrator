require 'rails_helper'

feature "User visits the website" do
  let!(:topic) { create(:topic)}
  let!(:question) { create(:question, topic: topic)}
  scenario "when user visits a question comment form is visible" do
    #question = create(:question)
    visit topic_path(topic)

    find('.collapsible-header', :text => question.content).click
    expect(page).to have_selector("textarea[name='comment[content]']")
    expect(page).to have_selector("input[name='comment[author]']")
  end

  pending "when user visits a question, comment can be created and appears correctly" do
    comment = build(:comment, question: question)
    visit topics_path
    click_link(topic.title)
    find('.collapsible-header', :text => question.content).click
    fill_in('comment[content]', :with => comment.content)
    fill_in('comment[author]', :with => comment.author)
    click_button 'add'
    #wait_for_ajax
    expect(page).to have_content comment.content
    expect(page).to have_content comment.author
    #expect(page).to have_content "Just Now!"
  end

  pending "when creator deletes a question" do
    comment = create(:comment, question: question)
    visit "/topics/#{topic.friendly_id}"
    find('.collapsible-header', :text => question.content).click
    click_link("delete", options = {href: comment_path(comment) })
    expect(page).to_not have_content comment.content
  end
end