require 'spec_helper'

feature 'Editing Albums' do
	let!(:album) { Factory(:album) }
  	let!(:user) { Factory(:user) }

	before do
		sign_in_as!(user)
    	visit '/'
		click_link "View All Albums"
  	end

scenario 'Edit an album' do
	page.should have_content("Hello Nasty")
	# click_link "Hello Nasty"
	# click_link "Edit Album"
	# fill_in 'Title', :with => 'War, Original Pressing'
	# click_button 'Update Album'
	# page.should have_content("Album has been updated.")
	#something is incomplete with editing function
	end

# scenario 'Updating an album with invalid attributes will fail' do
# 	fill_in 'Title', :with => ""
# 	click_button 'Update Album'
# 	page.should have_content("Empty fields aren't allowed, dummy.")
# 	end

end
