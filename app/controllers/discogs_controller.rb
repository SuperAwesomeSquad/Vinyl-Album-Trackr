require 'json'
require 'net/http'

class Discogs
  attr_reader :response_code # The most recent HTTP response code
  USER_AGENT = "Celluloid/0.1 +http://github.com/allynfolksjr/Celluloid" # Unique client ID
  API_URL = "http://api.discogs.com/"
  def make_get_request(request,request_params=nil)
    url = URI.parse("#{API_URL}#{request}")
    url.query = URI.encode_www_form(request_params) unless request_params.nil?
    req = Net::HTTP::Get.new(url.path)
    req['User-Agent'] = USER_AGENT
    res = Net::HTTP.start(url.host,url.port) { |http|
      http.request(req)
    }
    @response_code = res.code.to_i # It's a string otherwise. Annoying.
    JSON.parse(res.body) # Send a nicely-parsed JSON object back
  end
  def make_image_request(request,type,filename)
    Dir.mkdir("./images") unless File::directory?("./images")
    Dir.mkdir("./images/#{type}") unless File::directory?("./images/#{type}")
    url = URI.parse(request.to_s)
    Net::HTTP.start(url.host,url.port) do |http|
      response = http.get(url.path)
      # It will write a file every time. I suppose we could check exists?
      open("./images/#{type}/#{filename}.jpg", "wb") do |file|
        file.write(response.body)
      end
    end
  end
  def make_album_request(id)
    request = "/releases/#{id}"
    Album.new(make_get_request(request)) # shoves json into Album instance
  end
  def make_artist_request(id)
    request = "/artists/#{id}"
    Artist.new(make_get_request(request)) # shoves json into Artist instance
  end
  # Not fully implemented yet
  def make_artist_releases_request(id)
    request = "/artists/#{id}/releases"
    make_get_request(request)
  end
  # This will only grab the first image and ignores the others
  def make_artist_art_request(id)
    result = make_artist_request(id)
    make_image_request(result.images.first["uri"],"artists",id)
  end
   # This will only grab the first image and ignores the others
   def make_album_art_request(id)
     result = make_album_request(id)
     make_image_request(result.images.first["uri"],"albums",id)
   end
  # Not implemented
  def search(params)
    request = "/database/search"
    make_get_request(request,params)
end
def artist_search(param)
  search({"artist" => param})
end
end

# Basic class that has some standard methods and attributes
class GenericDiscogsWrapper
  attr_reader :json_hash
  def initialize(json_hash)
    @json_hash = json_hash
  end
end
# All album requests will be returned in this object
class Album < GenericDiscogsWrapper
  # Define a load of attributes.
  %w(styles labels year images community artists id genres title master_id tracklist status release_formatted master_url released country notes companies uri formats resource_url data_quality).each do |resource|
    define_method(resource) do
      @json_hash[resource]
    end
  end
end
# All artist requests will be returned in this object
class Artist < GenericDiscogsWrapper
  # Define a load of attributes
  %w(id name realname profile data_quality namevariations aliases urls images).each do |resource|
    define_method(resource) do
      @json_hash[resource]
    end
  end
end
