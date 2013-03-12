require 'spec_helper'

feature "Viewing collections" do

  before do
    user = Factory(:user)
    sign_in_as!(user)
  end

  scenario "Viewing a collection" do
      # click_link 'Log In'
      # fill_in "Email", :with => "celluloid@example.com"
      # fill_in "Password", :with => "password"
      # click_button 'Sign in'

      # visit '/collections'
      click_on 'My Collection'
      # # within(h2) do
      #   page.should have_content("Your Album Collection")
      # end

   end

end
