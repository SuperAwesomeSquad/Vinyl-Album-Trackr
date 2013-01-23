require 'spec_helper'

feature 'Viewing Albums' do
  scenario "can view an album" do
    visit '/albums/1'
    page.should have_content('Artist:')
  end
end

# page 70 of rails book
