require 'rails_helper'

describe User do

  describe 'Following' do
    before(:each) do
      @user1 = build(:user)
      @user2 = build(:user)
      
    end

    it "follows other users correctly" do
      @user1.follow(@user2)
      expect(@user1.followers).to include @user2
    end

    it "unfollows other users correctly" do
      @user1.unfollow(@user2)
      expect(@user1.followers).not_to include @user2
    end


  end
end