require 'json'
require 'net/http'
module AlbumsHelper
  USER_AGENT = "Celluloid/0.1 +http://github.com/allynfolksjr/Celluloid" # Unique client ID
  API_URL = "http://api.discogs.com/"
  def make_get_request(request,request_params=nil)
    url = URI.parse("#{API_URL}#{request}")
    url.query = URI.encode_www_form(request_params) unless request_params.nil?
    req = Net::HTTP::Get.new(url.request_uri)
    req['User-Agent'] = USER_AGENT
    res = Net::HTTP.start(url.host,url.port) { |http|
      http.request(req)
    }
   JSON.parse(res.body) # Send a nicely-parsed JSON object back
  end
  def make_album_request(id)
    request = "releases/#{id}"
    parse_album_json(make_get_request(request))
  end
  def parse_album_json(json)
    {artist: json["artists"][0]["name"],
      title: json["title"],
      year:  json["year"],
      genres: json["genres"]
    }
  end
  def search_for_album(params)
    request = "database/search"
    make_get_request(request,params)
  end
end
