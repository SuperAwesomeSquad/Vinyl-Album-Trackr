require 'spec_helper'

feature "Creating Lists" do
	before do
		visit '/'
		click_link 'Sign in'
		fill_in 'Email', :with => "celluloid@example.com"
		fill_in 'Password', :with => "password"
		click_button "Sign in"
		page.should have_content("Signed in successfully.")
		click_on "My Collection"
	end

scenario "Add albums to list" do
	click_button "Search for Album"
	fill_in "Title", :with => "Hello Nasty"
	click_button "Add to my collection."
	page.should have_content("Album has been added.")
end

end
