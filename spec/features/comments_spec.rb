require 'rails_helper'

feature "User visits the website" do
  let!(:question) { create(:question)}
  scenario "when user visits a question comment form is visible" do
    #question = create(:question)
    visit '/questions'
    puts Question.all
    find('.collapsible-header', :text => question.content).click
    expect(page).to have_selector("textarea[name='comment[content]']")
    expect(page).to have_selector("input[name='comment[author]']")
  end

  scenario "when user visits a question, comment can be created and appears correctly" do
    comment = build(:comment, question: question)
    visit '/questions'
    find('.collapsible-header', :text => question.content).click
    fill_in('comment[content]', :with => comment.content)
    fill_in('comment[author]', :with => comment.author)
    click_button 'add'
    #wait_for_ajax
    expect(page).to have_content comment.content
    expect(page).to have_content comment.author
    #expect(page).to have_content "Just Now!"
  end

  scenario "when user deletes a question" do
    comment = create(:comment, question: question)
    visit '/questions'
    find('.collapsible-header', :text => question.content).click
    click_link("delete", options = {href: comment_path(comment) })
    expect(page).to_not have_content comment.content
  end
end