require 'json'
require 'net/http'

class Discogs
  attr_reader :response_code
  USER_AGENT = "Celluloid/0.1 +http://github.com/allynfolksjr/Celluloid"
  API_URL = "http://api.discogs.com/"
  def make_get_request(request)
    url = URI.parse("#{API_URL}#{request}")
    req = Net::HTTP::Get.new(url.path)
    req['User-Agent'] = USER_AGENT
    res = Net::HTTP.start(url.host,url.port) { |http|
      http.request(req)
    }
    @response_code = res.code.to_i
    JSON.parse(res.body)
  end
  def make_image_request(request,type,filename)
    Dir.mkdir("./images") unless File::directory?("./images")
    Dir.mkdir("./images/#{type}") unless File::directory?("./images/#{type}")
    url = URI.parse(request.to_s)
    Net::HTTP.start(url.host,url.port) do |http|
      response = http.get(url.path)
      open("./images/#{type}/#{filename}.jpg", "wb") do |file|
        file.write(response.body)
      end
    end
  end
  def make_album_request(id)
    request = "/releases/#{id}"
    result = Album.new(make_get_request(request))
    result
  end
  def make_artist_request(id)
    request = "/artists/#{id}"
    result = Artist.new(make_get_request(request))
    result
  end
  def make_artist_releases_request(id)
    request = "/artists/#{id}/releases"
    make_get_request(request)
  end
  def make_artist_art_request(id)
    result = make_artist_request(id)
    make_image_request(result.images.first["uri"],"artist",result.name)
  end
  def make_album_art_request(id)
     result = make_album_request(id)
     make_image_request(result.images.first["uri"],"album",result.title)
  end
  def search(terms)
  end
  def search_results(terms)
  end
end

class GenericDiscogsWrapper
  attr_reader :json_hash
  def initialize(json_hash)
    @json_hash = json_hash
  end
end


class Album < GenericDiscogsWrapper
  %w(styles  labels year images community artists id genres title master_id tracklist status release_formatted master_url released country notes companies uri formats resource_url data_quality).each do |resource|
    define_method(resource) do
      @json_hash[resource]
    end
  end
end

class Artist < GenericDiscogsWrapper
  %w(id name realname profile data_quality namevariations aliases urls images).each do |resource|
    define_method(resource) do
      @json_hash[resource]
    end
  end
end
