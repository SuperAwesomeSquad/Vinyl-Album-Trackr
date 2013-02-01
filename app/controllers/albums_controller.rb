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

	def edit
	 	@album = Album.find(params[:id]) 
	end

	def update 
		@album = Album.find(params[:id]) 
		if @album.update_attributes(params[:album])
			flash[:notice] = "Album has been updated."
			redirect_to @album 
		else
			flash[:alert] = "Empty fields aren't allowed, dummy."
			render :action => "edit" 
		end
	end

	def destroy 
		@album = Album.find(params[:id]) 
		@album.destroy
		flash[:notice] = "Album has been deleted." 
		redirect_to albums_path 
	end
end
