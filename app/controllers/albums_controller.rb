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
	 	end

	 	def create
	 		@params = params
	 		discogs_data = make_album_request(params[:discogs_id])
	 		@album = Album.new({
	 			:discogs_id => discogs_data["id"],
	 			:title => discogs_data["title"],
	 			:tracklist => discogs_data["tracklist"],
	 			:artists => discogs_data["artists"],
	 			:year => discogs_data["year"],
	 			:genres => discogs_data["genres"],
	 			:styles => discogs_data["styles"]
	 			})
	 		@album.user = current_user
	 		if @album.save
	 			flash[:success] = "Album has been created."
	 			redirect_to @album
	 		else
	 			flash[:error] = "Album has not been created because you're lame."
	 			render :action => "new"
	 		end
	 	end

	 	def update
	 		if @album.update_attributes(params[:album])
	 			flash[:success] = "Album has been updated."
	 			redirect_to @album
	 		else
	 			flash[:error] = "Empty fields aren't allowed, dummy."
	 			render :action => "edit"
	 		end
	 	end

	 	def destroy
	 		@album.destroy
	 		flash[:success] = "Album has been deleted."
	 		redirect_to albums_path
	 	end

	 	def discogs_view_album
	 		if params["discogs_id"]
	 			@album = make_album_request(params["discogs_id"])
	 		else
	 			flash[:error] = "No album ID specified."
	 			redirect_to new_album_path
	 		end
	 	end

	 	def discogs_search
	 		if params["q"].empty?
	 			flash[:error] = "No search terms entered; please try again."
	 			redirect_to new_album_path
	 		end

	 		@results = search_for_album({
	 			q: params["q"],
	 			type: "master"
	 			})

	 		if @results.empty?
	 			flash[:error] = "No results found; please try again."
	 			redirect_to new_album_path
	 		end
	 	end

	 	private
	 	def find_album
	 		@album = Album.find(params[:id])
	 	rescue ActiveRecord::RecordNotFound
	 		flash[:error] = "The album you were looking for could not be found."
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
	 		if res.code.to_i == 200
   			JSON.parse(res.body) # Send a nicely-parsed JSON object back
   		else
   			raise "Error"
   		end
   	end

   	def make_album_request(id)
   		request = "master/#{id}"
   		pretty_album_results(make_get_request(request))
   	end

   	def search_for_album(params)
   		request = "database/search"
   		pretty_search_results(make_get_request(request,params))
   	end
   	def pretty_search_results(hash)
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
   	def pretty_album_results(hash)
   		hash["resp"]["master"]
   		# hash
   	end
   end
