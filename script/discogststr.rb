require 'json'
require 'net/http'
require_relative 'discogs_hash_file.rb'
class Discogs
   USER_AGENT = "Celluloid/0.1 +http://github.com/allynfolksjr/Celluloid" # Unique client ID
   API_URL = "http://api.discogs.com/"
   def self.make_get_request(request,request_params=nil)
    url = URI.parse("#{API_URL}#{request}")
    url.query = URI.encode_www_form(request_params) unless request_params.nil?
    req = Net::HTTP::Get.new(url.request_uri)
    req['User-Agent'] = USER_AGENT
    res = Net::HTTP.start(url.host,url.port) { |http|
      http.request(req)
    }
   p JSON.parse(res.body) # Send a nicely-parsed JSON object back
 end
 def make_album_request(id)
  request = "releases/#{id}"
  pretty_results(make_get_request(request))
end
def self.search_for_album(params)
  request = "database/search"
  retty_results(make_get_request(request,params))
end
def self.pretty_results(hash)
  big_ole_array_of_hashes = []
  hash["results"].each do |album|
    big_ole_array_of_hashes << {
      artist: album["title"].split(" - ")[0],
      title: album["title"].split(" - ")[1],
      year: album["year"],
      discogs_id: album["id"],
      genres: album["genres"]
    }
  end
  big_ole_array_of_hashes
end
end

p $music_has_the_right_ugly
# Discogs.search_for_album(
#       {
#         q: "Music has the right to children",
#         type: "master"
#       }
#       )
# derp = []
# $neil_young_pretty.each do |h|
#   derp << h[:artist]
# end
# derp.uniq!
# p derp
# derp.each do |artist|
#   print "\n\n#{artist}\n....\n"
#   $neil_young_pretty.each do |h|
#     print "* #{h[:title]}\n" if h[:artist] == artist

#  end
# end

# derp = []

# $music_has_the_right_pretty.each do |h|
#   derp << h[:artist]
# end
# derp.uniq!
# p derp
# derp.each do |artist|
#   print "\n\n#{artist}\n....\n"
#   $music_has_.each do |h|
#     print "* #{h[:title]}\n" if h[:artist] == artist

#  end
# end

