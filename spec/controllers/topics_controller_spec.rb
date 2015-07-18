require 'rails_helper'


RSpec.describe TopicsController, type: :controller do

	describe "topics#index" do

	  xit "assigns all topics as @topic" do
        expect(assigns(:topic)).to be_a Topic
	  end
  end
end