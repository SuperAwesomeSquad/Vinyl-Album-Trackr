require 'spec_helper'

feature "Creating Personal Collection" do

	before do
			user = Factory(:user, :email => "celluloid@example.com")
			# define_permission!(user, "view", project)
   #  		define_permission!(user, "create tickets", project)
    		sign_in_as!(user)

			visit '/'
			click_link "My Collection"
			click_link "Add New Collection"
	end


# scenario "Verify collection exists" do
# 		visit '/'
# 		click_link 'Sign in'
# 		fill_in 'Email', :with => "celluloid@example.com"
# 		fill_in 'Password', :with => "password"
# 		click_button "Sign in"
# 		page.should have_content("Signed in successfully.")
# 		click_on "My Collection"

# 	end

scenario "Add albums to collection" do
	click_button "Search for Album"
	fill_in "Title", :with => "Hello Nasty"
	click_button "Add to my collection."
	page.should have_content("Album has been added.")
	end

end
