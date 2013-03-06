require 'spec_helper'

describe AlbumsController do
	it "displays an error for a missing album" do
		get :show, :id => "not-here"
		response.should redirect_to(albums_path)
		message = "The album you were looking for could not be found."
		flash[:alert].should == message
	end


  # context "Viewing things" do
  #   before do
  #     @result_album = make_album_request(1)
  #   end
  it "can make a discogs request" do
    @result_album = make_album_request(1)
    @result_album.class.should eq Hash
  end
  it "Can return some dope-ass information for a discogs request" do
    @result_album = make_album_request(1)
    @result_album[:title].should == "Stockholm"
    @result_album[:artist].should == "Persuader, The"
    @result_album[:year].should == 1999
    @result_album[:genres].should == ["Electronic"]
  end
  # context "Searching" do
  it "Can make a search or somethin'" do
    results = search_for_album({q: "Music Has the Right to Children", type: "master"})
    pretty_results(results).class.should eq Array
  end

  # end

end
