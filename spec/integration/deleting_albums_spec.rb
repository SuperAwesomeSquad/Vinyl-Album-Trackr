require 'spec_helper'

feature 'Deleting Albums' do
  scenario 'Deleting an album' do
    album = Factory.create(:album, :title => 'Ill Communication', :artist => 'Beastie Boys')
    visit '/'
    click_link 'Ill Communication'
    click_link 'Delete Album'
    page.should have_content("Album has been deleted.")  

    visit '/'
	page.should_not have_content('Ill Communication')
	end
end
