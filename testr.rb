require './lib/Discogs.rb'
testr = Discogs.new
result = testr.make_get_request("/releases/3114901")
puts testr.title
puts testr.tracklist