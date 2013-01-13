require 'discogs'

describe Discogs do
  before do
    @request = Discogs.new
  end
  context "Basic functionality" do
    it "Allows you to create a basic request object" do
      test_request = Discogs.new
    end
  end
  context "Album retrieval" do
    before do
      @result = @request.make_album_request(3114901)
    end
    it "Will make a successful request" do
      @request.response_code.should eq 200
    end
    it "Should return an album object" do
      @result.class.should eq Album
    end
    it "Can retrieve information about a specific album" do
      @result.title.should eq 'The Hollows'
    end
    it "Can retrieve album art" do
      @request.make_album_art_request(1)
      File.exists?("./images/albums/1.jpg").should eq true
    end
  end
  context "Artist Retrieval" do
     before do
      @result = @request.make_artist_request(55554)
    end
     it "Will make a successful request" do
      @request.response_code.should eq 200
    end
     it "Should return an Artist object" do
      @result.class.should eq Artist
    end
    it "Can retrieve information about a specific artist" do
      @result.name.should eq "Why?"
    end
    it "Can retrieve artist picture" do
      @request.make_artist_art_request(55554)
      File.exists?("./images/artists/55554.jpg").should eq true
    end
  end
  context "Artist relesese" do
    it "Can display an artists' releases"
  end
  context "Search" do
    it "Can perform basic search functions"
    it "Can display search results"
    it "Allows you to choose a search result"
  end
end

describe Album do
  it "An album object is retrieved after a successful get request"
  it "Will tell you the artist"
  it "Will tell you the community"
  it "Will tell you the tracklist"
end

describe Artist do
  it "Will return an artist object after a successful get request"
  it "Will tell you the artist"
  it "Will show you the genres"
  it "Will show you their albums"
end
