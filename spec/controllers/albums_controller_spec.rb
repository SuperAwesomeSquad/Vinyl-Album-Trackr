require 'spec_helper'

describe AlbumsController do

  let!(:album) { Factory(:album) }

  before do
    visit '/'
    click_link 'Log In'
    fill_in 'Email', :with => "celluloid@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    # click_link 'Add Album'
  end

# 	it "empty album search" do
# 		click_link "Search"
# 		response.should redirect_to(albums_path)
# 		message = "No search terms entered; please try again."
# 		flash[:alert].should == message
# 	end

# it "can make a discogs request" do
#   # fill_in 'Search', :with => 'Hello Nasty'
#   @result_album = make_album_request(20224)
#   @result_album.class.should eq Hash
# end

# it "Can return some awesome information for a discogs request" do
#   @result_album = make_album_request(20224)
#   @result_album[:title].should == "Hello Nasty"
#   @result_album[:artist].should == "Beastie Boys"
#   @result_album[:year].should == 1999
#   @result_album[:genres].should == ["Electronic"]
# end


end
