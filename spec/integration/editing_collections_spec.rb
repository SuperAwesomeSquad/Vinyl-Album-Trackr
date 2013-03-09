require 'spec_helper'

feature "Editing Lists" do
	before do
		visit '/'
		click_link 'Sign in'
		fill_in 'Email', :with => "celluloid@example.com"
		fill_in 'Password', :with => "password"
		click_button "Sign in"
		page.should have_content("Signed in successfully.")
	end

scenario "Edit existing list" do
	click_link "My list"
	click_link "Edit list"
	click_link "Ill Communication"
	click_button "Add condition"
	page.should have_content("Album has been updated.")
end

end
