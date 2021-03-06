require 'rails_helper'

describe Relationship do
  before(:each) do
    @relationship = FactoryGirl.create(:relationship)
  end

  it "should be valid" do
    expect(@relationship.valid?).to be true
  end

  it "should require a follower_id" do
    @relationship.follower_id = nil
    expect(@relationship.valid?).to be false
  end

  it "should require a followed_id" do
    @relationship.followed_id = nil
    expect(@relationship.valid?).to be false
  end

end