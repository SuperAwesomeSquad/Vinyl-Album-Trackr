# require 'spec_helper'

# feature "Editing Collections" do

# 	scenario "Updating a collection" do
# 		Factory(:collection, :title => "Hello Nasty", :artist => "Beastie Boys")
# 		visit "/"
# 		click_link "My Collection"
# 		click_link "Hello Nasty"
# 		click_link "Edit Collection"
# 		fill_in "Title", :with => "Hello Nasty, Japan"
# 		click_button "Update Collection"
# 		page.should have_content("Collection has been updated.")
# end end

#editing albums now, not collections
