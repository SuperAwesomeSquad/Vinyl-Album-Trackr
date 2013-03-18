require 'spec_helper'

feature 'Signing in' do
	before do
		Factory(:user, :email => "celluloid@example.com")
	end

# Re-add the following spec if/when user confirmation with email
# is re-implimented

# scenario 'Signing in via confirmation' do
# 	open_email "celluloid@example.com", :with_subject => /Confirmation/
# 	click_first_link_in_email
# 	page.should have_content("Your account was successfully confirmed")
# 	end

scenario 'Signing in via form' do
	# User.find_by_email('celluloid@example.com')
	visit '/'
	click_link 'Log In'
	fill_in 'Email', :with => "celluloid@example.com"
	fill_in 'Password', :with => "password"
	click_button "Sign in"
	page.should have_content("Hey there, celluloid@example.com!")
	end

end
