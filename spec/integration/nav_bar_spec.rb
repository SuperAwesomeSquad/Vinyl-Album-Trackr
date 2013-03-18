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
    sign_in_as!(user)
    visit root_path
    page.should have_link("Log Out")
    page.should_not have_link("Log In")
    page.should_not have_link("Sign Up")
  end

end

