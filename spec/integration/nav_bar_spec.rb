require 'spec_helper'

feature 'Navigation Bar' do

  let!(:user) { Factory(:user)}

  scenario "should be provide navigation functionality" do
    visit root_path
    page.should have_link("My Collection")
    page.should have_link("View All Albums")
    page.should have_link("Add Album")
  end

  scenario "should be provide user functionality" do
    visit root_path
    page.should have_link("Log In")
    page.should have_link("Sign Up")
  end

  scenario "should show proper links when logged in" do
    sign_in_as

  # scenario "Link to View All Albums" do
  #   click_link('View All Albums')
  #   page.current_url.should == albums_url
  # end
  # scenario "Should show your current location" do
  #   find(:xpath, "//li[@class='active']/a").text.should == "Celluloid"
  #   click_link('View All Albums')
  #   find(:xpath, "//li[@class='active']/a").text.should == "View All Albums"
  # end
  # scenario "can not create an album without an artist" do
  #   fill_in 'Title', :with => 'Ill Communication'
  #   click_button "Create Album"
  #   page.should have_content("Album has not been created.")
  #   page.should have_content("Artist can't be blank")
  # end
end

