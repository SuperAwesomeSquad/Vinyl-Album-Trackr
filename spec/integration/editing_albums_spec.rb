require 'spec_helper'

feature 'Editing Projects' do 

before do
	Factory(:album, :title => 'Ill Communication', :artist=>'Beastie Boys') 
	visit '/albums' 
	click_link 'Ill Communication' 
	click_link 'Edit Album'
end

scenario 'Updating an album' do 
	fill_in 'Title', :with => 'Ill Communication, Original Pressing'
	click_button 'Update Album' 
	page.should have_content("Album has been updated.")
	end 

scenario 'Updating an album with invalid attributes will fail' do 
	fill_in 'Title', :with => ""
	click_button 'Update Album'
	page.should have_content("Empty fields aren't allowed, dummy.")
	end

end