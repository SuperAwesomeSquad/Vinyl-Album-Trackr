class AlbumsController < ApplicationController
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
			flash[:alert] = "Album has not been created."
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

	private 
	def find_album
		@album = Album.find(params[:id]) 
		rescue ActiveRecord::RecordNotFound 
			flash[:alert] = "The album you were looking for could not be found." 
			redirect_to albums_path
	end
end
