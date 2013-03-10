class CollectionsController < ApplicationController

# before_filter :find_collection, :only => [:show,
# 										  :edit,
# 										  :update,
# 										  :destroy]
before_filter :authenticate_user!

	def index
		@collections = Collection.all
	end

	def new
		@collection = Collection.new
	end

	def create
		@collection = Collection.new(params[:collection])
		if @collection.save
			flash[:success] = "Collection has been created."
			redirect_to @collection
		else
			flash[:error] = "Collection has not been created."
			render :action => "new"
		end
	end

	def show
		@collection = Collection.find(params[:id])
	end

	def edit
		@collection = Collection.find(params[:id])
	end

	def update
		@collection = Collection.find(params[:id])
		if  @collection.update_attributes(params[:collection])
			flash[:success] = "Collection has been updated."
			redirect_to @collection
		else
			flash[:error] = "Collection has not been updated."
			render :action => "edit"
		end
	end

	def destroy
		@collection = Collection.find(params[:id])
		@collection.destroy
		flash[:error] = "Project has been deleted."
		redirect_to collections_path
	end

	# private
	# 	def find_collection
	# 		# @project = Project.find(params[:id])
	# 		# @project = if current_user.admin?
	# 		# 	Project.find(params[:id])
	# 		# else Project.viewable_by(current_user).find(params[:id])
	# 		# end
	# 		@collection = Collection.find(params[:id])
	# 		rescue ActiveRecord::RecordNotFound
	# 		flash[:error] = "The collection you were looking for could not be found."
	# 		redirect_to collections_path
	# 	end
end
