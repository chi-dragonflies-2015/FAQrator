require 'rails_helper'
require 'support/Factory_girl'

RSpec.feature 'User visiting site', type: :feature do

	xscenario 'When user visits the main page' do
    FactoryGirl.create(:topic)

   end

end