require 'spec_helper'

feature 'Creating albums' do
  before do
    visit '/'
    click_link 'Add Album'
  end
  scenario "can create an album" do
    fill_in 'Title', :with => 'Ill Communication'
    fill_in 'Artist', :with => 'Beastie Boys'
    click_button 'Create Album'
    page.should have_content('Album has been created.')
    album = Album.find_by_title('Ill Communication')
    page.current_url.should == album_url(album)
    # page.should have_content("Beastie Boys")
  end
  scenario "can not create an album without a name" do
    click_button "Create Album"
    page.should have_content("Album has not been created.")
    page.should have_content("Title can't be blank")
  end
  scenario "can not create an album without an artist" do
    fill_in 'Title', :with => 'Ill Communication'
    click_button "Create Album"
    page.should have_content("Album has not been created.")
    page.should have_content("Artist can't be blank")
  end
end

# page 70 of rails book
