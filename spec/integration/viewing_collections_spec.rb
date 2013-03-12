require 'spec_helper'

feature "Viewing collections" do

  scenario "Viewing a collection" do
      visit '/'
      click_link 'Log In'
      fill_in "Email", :with => "celluloid@example.com"
      fill_in "Password", :with => "password"
      click_button 'Sign in'


      visit '/collections'
      within("h2") do
        page.should have_content("Your Album Collection")
      end
   end

end
