require 'spec_helper'

feature 'Navigation Bar' do

  before do
    visit '/'
    click_link 'Log In'
    fill_in "Email", :with => "celluloid@example.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    end

  scenario "Link to Home Page" do
    page.first(".brand").click
    # find(".brand").click
    # page.should have_content('Celluloid')
    # click_link('Celluloid')
    page.current_url.should == root_url
  end

  scenario "Link to View All Albums" do
    click_link('View All Albums')
    page.current_url.should == albums_url
  end
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

