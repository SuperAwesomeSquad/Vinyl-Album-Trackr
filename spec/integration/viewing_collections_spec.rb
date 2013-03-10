require 'spec_helper'

feature "Viewing Collection" do
	before do
		my_collection = Factory(:collection,
			:title => "Hello Nasty",
			:artist=>"Beastie Boys")
		user = Factory(:user, :email => "celluloid@example.com")
	visit '/'
end

scenario "Viewing collection for a given user" do
	click_link "Hellow Nasty"
	page.should_not have_content("Licensed To Ill")
	click_link "Make it shiny!"
	within("#ticket h2") do
		page.should have_content("Make it shiny!")
	end
	page.should have_content("Gradients! Starbursts! Oh my!")
end

end
