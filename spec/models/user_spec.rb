require 'rails_helper'

describe User do

  describe 'Following' do
    before(:each) do
      @user1 = create(:user)
      @user2 = create(:user)
      @user1.follow(@user2)
    end

    it "follows other users correctly" do
      expect(@user1.following).to include @user2
    end

    it "follows other users correctly" do
      expect(@user2.followers).to include @user1
    end

    it "unfollows other users correctly" do
      @user1.unfollow(@user2)
      expect(@user1.following).not_to include @user2
    end

    it "unfollows other users correctly" do
      @user1.unfollow(@user2)
      expect(@user2.followers).not_to include @user1
    end

  end
  
end