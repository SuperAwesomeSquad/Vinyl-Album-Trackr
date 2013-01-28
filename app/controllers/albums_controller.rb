class AlbumsController < ApplicationController
	def index
	end

	def new
		@album = Album.new
	end

	def create 
		@album = Album.new(params[:project]) 
		if @album.save
			flash[:notice] = "Album has been created."
			redirect_to @album 
		else
		# nothing, yet end
		end
	end

	# def show 
	# 	@album = Album.find(params[:id])
	# end

end
