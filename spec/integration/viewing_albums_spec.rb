require 'spec_helper'

feature 'Viewing Albums' do
  scenario "can view an album" do
    project = Factory.create(:album, :title => 'Ill Communication', :artist => 'Beastie Boys')
    visit '/'
    click_link 'Ill Communication'
    page.current_url.should == album_url(album)
  end
end
