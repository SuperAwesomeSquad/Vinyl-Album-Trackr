require 'spec_helper'

feature 'Creating albums' do
  scenario "can create an album" do
    visit '/'
    click_link 'Create Album'
    fill_in 'Title', :with => 'Ill Communication'
    fill_in 'Artist', :with => 'Beastie Boys'
    click_button 'Add Album'
    page.should have_content('Album has been created.')
  end
end

# page 70 of rails book
