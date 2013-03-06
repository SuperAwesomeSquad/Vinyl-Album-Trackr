require 'json'
require 'net/http'
class AlbumsController < ApplicationController
	 USER_AGENT = "Celluloid/0.1 +http://github.com/allynfolksjr/Celluloid" # Unique client ID
	 API_URL = "http://api.discogs.com/"
	 before_filter :authenticate_user!, :except => [:index, :show]
	 before_filter :find_album, :only => [:show,
	 	:edit,
	 	:update,
	 	:destroy]

	 	def index
	 		@albums = Album.all
	 	end

	 	def new
	 		@album = Album.new
	 	end

	 	def create
	 		@album = Album.new(params[:album])
	 		@album.user = current_user
	 		if @album.save
	 			flash[:notice] = "Album has been created."
	 			redirect_to @album
	 		else
	 			flash[:alert] = "Album has not been created because you're lame."
	 			render :action => "new"
	 		end
	 	end

	 	def update
	 		if @album.update_attributes(params[:album])
	 			flash[:notice] = "Album has been updated."
	 			redirect_to @album
	 		else
	 			flash[:alert] = "Empty fields aren't allowed, dummy."
	 			render :action => "edit"
	 		end
	 	end

	 	def destroy
	 		@album.destroy
	 		flash[:notice] = "Album has been deleted."
	 		redirect_to albums_path
	 	end

	 	def discogs_search
	 		@results = search_for_album(
	 		{
	 			q: params["album"]["title"],
	 			type: "master"
	 		}
	 		)
	 		@search = params
	 #redirect_to :action => 'discogs_result'
	end

	private
	def find_album
		@album = Album.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:alert] = "The album you were looking for could not be found."
		redirect_to albums_path
	end
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
 	pretty_results(make_get_request(request,params))
 end
 def pretty_results(hash)
 	big_ole_array_of_hashes = []
 	hash["results"].each do |album|
 		big_ole_array_of_hashes << {
 			artist: album["title"].split(" - ")[0],
 			title: album["title"].split(" - ")[1],
 			year: album["year"]
 		}
 	end
 	big_ole_array_of_hashes
 end
end
