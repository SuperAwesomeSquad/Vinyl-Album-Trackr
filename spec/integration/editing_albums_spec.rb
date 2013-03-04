# require 'spec_helper'

# feature 'Editing Albums' do

# before do
# 	Factory(:album, :title => 'Hello Nasty', :artist=>'Beastie Boys')
# 	visit '/albums'
# 	click_link 'View All Albums'
# 	click_link 'Hello Nasty'
# 	click_link 'Edit Album'
# end

# scenario 'Updating an album' do
# 	fill_in 'Title', :with => 'Hello Nasty, Original Pressing'
# 	click_button 'Update Album'
# 	page.should have_content("Album has been updated.")
# 	end

# scenario 'Updating an album with invalid attributes will fail' do
# 	fill_in 'Title', :with => ""
# 	click_button 'Update Album'
# 	page.should have_content("Empty fields aren't allowed, dummy.")
# 	end

# end
