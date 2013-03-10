# require 'spec_helper'

# feature "Creating Personal Collection" do

# 	before do
# 			user = Factory(:user, :email => "celluloid@example.com")
# 			Factory(:collection, :name => "My Collection", :artist=>"Beastie Boys", :title =>"Hello Nasty")
# 			# define_permission!(user, "view", project)
#    #  		define_permission!(user, "create tickets", project)
#     		# sign_in_as!(user)
#     		user.confirm!

# 			visit '/'
# 			click_link "My Collection"
# 			click_link "Add To Collection"
# 			message = "You need to sign in or sign up before continuing."
# 			page.should have_content(message)

# 			fill_in "Email", :with => "celluloid@example.com"
# 			fill_in "Password", :with => "password"
# 			click_button "Log in"
# 			within("h2") { page.should have_content("My Collection") }
# 			# within("#collection #user") do
# 			# 	page.should have_content("Created by celluloid@example.com")
# 			# end
# 	end


# scenario "Verify collection exists" do
# 		visit '/'
# 		click_link 'Sign in'
# 		fill_in 'Email', :with => "celluloid@example.com"
# 		fill_in 'Password', :with => "password"
# 		click_button "Sign in"
# 		page.should have_content("Signed in successfully.")
# 		click_on "My Collection"

# 	end

# scenario "Add albums to collection" do
# 	click_button "Search for Album"
# 	fill_in "Title", :with => "Hello Nasty"
# 	fill_in "Artist", :with => "Beastie Boys"
# 	click_button "Add to my collection."
# 	page.should have_content("Album has been added.")
# 	end

# scenario "Creating a collection without valid attributes fails" do
# 	click_button "Search for Album"
# 	fill_in "Title", :with => "Hello Nasty"
# 	click_button "Add to my collection."
# 	page.should have_content("Collection has not been created.")
# 	page.should have_content("Artist can't be blank")
# 	page.should have_content("Title can't be blank")
# end

require 'spec_helper'

feature 'Creating Collection' do
	before do
		visit '/'
		click_link 'My Collection'
	end

	scenario "can create a collection" do
		click_link 'Add New Collection'
		fill_in 'Name', :with => "Your Mom"
		fill_in 'Title', :with => "Hello Nasty"
		fill_in 'Artist', :with => "Beastie Boys"
		click_button 'Create Collection'
		page.should have_content('Collection has been created.')
	end

	scenario "can not create a collection without an album" do
		click_link 'Create Collection'
		page.should have_content("Collection has not been created.")
		page.should have_content("Fields can't be blank")
	end

end
