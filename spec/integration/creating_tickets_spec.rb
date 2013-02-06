require 'spec_helper'

feature "Creating Tickets" do
	before do
		Factory(:project, :name => "Internet Explorer")
		visit '/'
		click_link "Internet Explorer"
		click_link "New Ticket"	
	end

	scenario "Creating a ticket" do
		fill_in "Title", :with => "Non-stancards compliance"
		fill_in "Description", :with => "My pages are ugly!"
		click_button "Create Ticket"
		page.should have_content("Ticket has been created.")
	end

	scenario "Creating a ticket without valid attributes fails" do
		click_button "Create Ticket"
		page.should have_content("Ticket has not been created.")
		page.should have_content("Title can't be blank")
		page.should have_content("Description can't be blank")
	end
end
