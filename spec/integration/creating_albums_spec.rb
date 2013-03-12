require 'spec_helper'

feature 'Creating albums' do

  before do
      visit '/'
      click_link "Add Album"
  end


  scenario "can search for and create an album" do
    fill_in 'Search', :with => 'Licensed to Ill'
    click_button 'Search'
    # page.should have_css('div#beastie-boys')
    # page.should have_content("Licensed To Ill")
    # within("div#beastie-boys") do
    #   click_on "Add This Album"
    # end
    # page.should have_content("Album has been created.")
    # page.should have_content("Licensed To Ill")
  end

  scenario "will not accept a blank search" do
    click_button "Search"
    page.should have_content("No search terms entered; please try again.")
  end

  # scenario "will handle no results" do
  #   fill_in "Search", :with => "Derp derkejfhdsaklfhasklfhwieuhwgsd sdfskdjafh"
  #   click_button 'Search'
  #   page.should have_content("No results found; please try again.")

  # end
end
