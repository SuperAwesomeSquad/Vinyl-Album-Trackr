require 'spec_helper'

feature 'Creating albums' do
  scenario "can create an album" do
    visit '/'
    click_link 'Add Album'
    # fill_in 'Name'
    # fill_in etc
    click_button 'Add Album'
    page.should have_content('Album has been created.')
  end
end

# page 70 of rails book