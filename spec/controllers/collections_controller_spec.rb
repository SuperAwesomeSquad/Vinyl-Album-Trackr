require 'spec_helper'

describe CollectionsController do

	before do
		visit '/'
		click_link 'Log In'
     	fill_in "Email", :with => "celluloid@example.com"
      	fill_in "Password", :with => "password"
      	# page.should have_content("Signed in successfully.")
    end


	it "can access the collection root" do
		click_link 'My Collection'
		# visit '/collections'
		# page.should have_content("Your Album Collection")
	end

	# it "displays a suggestion for empty collection" do
	# 	get :show, :id => "not-here"
	# 	response.should redirect_to(collections_path)
	# 	message = "The collection you were looking for could not be found."
	# 	flash[:alert].should == message
	# end

end
