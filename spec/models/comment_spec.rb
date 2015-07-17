require 'rails_helper'

describe Comment do
  before(:each) do
    @comment = build(:comment)
  end

  it "returns content correctly" do
    expect(@comment.content).to eq "Test Comment"
  end

  it "returns name when provided" do
    @comment.author = "Pedro"
    @comment.save
    expect(@comment.author).to eq "Pedro"
  end

  it "returns Guest when name not provided" do
    @comment.save
    expect(@comment.author).to match(/Guest/)
  end

  it "saves when valid" do
    @comment.valid?
    expect(@comment.errors).to be_empty
  end

  it "does not save when invalid" do
    @comment.content = nil
    @comment.valid?
    expect(@comment.errors).to_not be_empty
  end
end