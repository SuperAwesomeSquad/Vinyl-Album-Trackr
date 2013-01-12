require 'json'
require 'net/http'

class Discogs
  attr_reader :album
  USER_AGENT = "Celluloid/0.1 +http://github.com/allynfolksjr/Celluloid"
  API_URL = "http://api.discogs.com/"
  def make_get_request(request)
    url = URI.parse("#{API_URL}#{request}")
    req = Net::HTTP::Get.new(url.path)
    req['User-Agent'] = USER_AGENT
    res = Net::HTTP.start(url.host,url.port) { |http| 
      http.request(req)
    }
    @album = JSON.parse(res.body)
  end
  %w(styles labels year community artists id genres title master_id tracklist status release_formatted master_url released country notes companies uri formats resource_url data_quality).each do |resource|
    define_method(resource) do
      @album[resource]
    end
  end

end
