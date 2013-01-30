class AlbumsController < ApplicationController
	def index
		@albums = Album.all
	end

	def new
		@album = Album.new
	end

	def create 
		@album = Album.new(params[:album]) 
		if @album.save
			flash[:notice] = "Album #{@album.title} has been created."
			redirect_to @album 
		else
			flash[:alert] = "Album has not been created."
			render :action => "new"
		end
	end

	def show 
		@album = Album.find(params[:id])
	 end

end
