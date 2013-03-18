require 'spec_helper'

feature 'Home Page' do
  let!(:album) {Factory(:album) }
  let!(:user) {Factory(:user) }

  before do
    visit root_path
    sign_in_as!(user)
  end
  scenario "It should display the navbar" do
    within ".navbar" do
      page.should have_link "Celluloid"
    end
  end


  scenario "It should display a random album" do
    within "#random-album" do
      page.should have_content "Example album"
    end
  end

  scenario "It should display a pretty footer" do
    within ".footer" do
      page.should have_content "Made with love"
      page.should have_link "@allynfolksjr"
      page.should have_link "@grrlcoder"
    end
  end

  scenario "It should welcome you" do
    within ".userinfo" do
      page.should have_content "Hey there, celluloid"
    end
  end

end
