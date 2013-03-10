require 'spec_helper'

feature "Viewing collections" do
	let!(:user) { Factory(:user) }
  	let!(:collection) { Factory(:collection) }

  	before do
    	sign_in_as!(user)
    	define_permission!(user, :view, project)
  	end

  scenario "Listing all collections" do
    visit '/'
    page.should_not have_content("Hello Nasty")
    click_link collection.name
    page.current_url.should == project_url(collection)
  end

end
