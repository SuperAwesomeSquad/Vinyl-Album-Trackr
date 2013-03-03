  require 'spec_helper'

  describe AlbumsHelper do
    describe "discogs" do
      context "Viewing things" do
        before do
          @result_album = make_album_request(1)
        end
        it "can make a discogs request" do
          @result_album.class.should eq Hash
        end
        it "Can return some dope-ass information for a discogs request" do
          @result_album[:title].should == "Stockholm"
          @result_album[:artist].should == "Persuader, The"
          @result_album[:year].should == 1999
          @result_album[:genres].should == ["Electronic"]
        end
      end
      context "Searching" do
        it "Can make a search or somethin'" do
          search_for_album({release_title:"Music Has the Right to Children"}).should == "hi"
        end
      end
    end
  end

