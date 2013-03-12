# require 'spec_helper'

# feature 'Creating albums' do

#   before do
#     user = Factory(:user)
#     sign_in_as!(user)
#     visit '/'
#     click_link "Add Album"
#   end


#   scenario "can search for and create an album" do
#     fill_in 'Search', :with => 'Licensed to Ill'
#     click_button 'Search'
#     # page.should have_css('div#beastie-boys')
#     # page.should have_content("Licensed To Ill")
#     # within("div#beastie-boys") do
#     #   click_on "Add This Album"
#     # end
#     # page.should have_content("Album has been created.")
#     # page.should have_content("Licensed To Ill")
#   end

#   scenario "will not accept a blank search" do
#     click_button "Search"
#     page.should have_content("No search terms entered; please try again.")
#   end

#   # scenario "will handle no results" do
#   #   fill_in "Search", :with => "Derp derkejfhdsaklfhasklfhwieuhwgsd sdfskdjafh"
#   #   click_button 'Search'
#   #   page.should have_content("No results found; please try again.")

#   # end
# end

require 'spec_helper'

feature 'Creating Albums' do

    before do
      # User.find_by_email('celluloid@example.com')
      visit '/'
      click_link 'Log In'
      fill_in 'Email', :with => "celluloid@example.com"
      fill_in 'Password', :with => "password"
      click_button "Sign in"
      page.find(".container").should has_text?('Signed in successfully.')
      # page.should have_link("Log Out")
      # page.should have_content("Hey there, celluloid@example.com!")
  end
      # user = Factory(:user)
      # sign_in_as!(user)

      # page.should have_content("Hey there, celluloid@example.com!")
      # within("container"){ page.should have_content("Signed in successfully.")}

  # scenario "can create an album" do
  #   click_link 'Add Album'
  #   page.should have_css("h2", :text => "Your Album Collection")
  #   # do
  #   #     page.should have_content("Your Album Collection")
  #   #   end
  #   # click_link 'Add Album'
  #   fill_in 'Search', :with => 'Licensed To Ill'
  #   click_button 'Search'
  #   page.should have_content('Licensed to Ill')
  #   within("div#beastie-boys") do
  #     click_on "Add This Album"
  #   end
  # end

end
