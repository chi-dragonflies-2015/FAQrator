require 'rails_helper'


RSpec.feature 'User visiting site', type: :feature do

	xscenario 'When user visits the main page' do
    FactoryGirl.create(:topic)

   end

end