require 'spec_helper'

feature "Viewing collections" do

  before do
    visit '/'
    click_link 'Log In'
    fill_in 'Email', :with => "celluloid@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
  end

  scenario "Viewing a collection" do
      page.should have_link("My Collection")

      # welcome = "Your Album Collection"
      # find("h2").should have_content(welcome)
   end

end
