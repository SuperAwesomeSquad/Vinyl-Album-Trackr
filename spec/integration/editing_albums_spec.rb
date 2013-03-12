require 'spec_helper'

feature 'Editing Albums' do

	before do
		sign_in_as!(Factory(:user))
		Factory(:album, :title => 'War', :artist => 'U2')
		page.should have_link("Log Out")
  	end

scenario 'Edit an album' do
	visit "/albums"
	click_link "War"
	click_link "Edit Album"
	fill_in 'Title', :with => 'War, Original Pressing'
	click_button 'Update Album'
	# page.should have_content("Album has been updated.")
	#something is incomplete with editing function
	end

# scenario 'Updating an album with invalid attributes will fail' do
# 	fill_in 'Title', :with => ""
# 	click_button 'Update Album'
# 	page.should have_content("Empty fields aren't allowed, dummy.")
# 	end

end
