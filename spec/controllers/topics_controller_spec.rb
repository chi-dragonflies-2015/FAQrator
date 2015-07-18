require 'rails_helper'
require 'support/Factory_girl'

RSpec.describe TopicsController, type: :controller do

	describe "topics#index" do

	  xit "assigns all topics as @topic" do
        expect(assigns(:topic)).to be_a Topic
	  end

end