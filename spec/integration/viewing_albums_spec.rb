require 'spec_helper'

feature 'Viewing Albums' do
  scenario "can view an album" do
    album = Factory.create(:album, :title => 'Ill Communication', :artist => 'Beastie Boys')
    visit albums_path
    click_link 'Ill Communication'
    page.current_url.should == album_url(album)
  end
end
