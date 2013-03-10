class CollectionsController < ApplicationController

before_filter :find_user
before_filter :find_collection, :only => [:show,
										  :edit,
										  :update,
										  :destroy]

def new
	@collection = @user.collections.build
end

def create
	@collection = @user.collection.build(params[:id])
		if @collection.save
			flash[:success] = "Your collection has been created."
			redirect_to [@user, @collection]
		else
			flash[:error] = "Your collection has not been created."
			render :action => "new"
		end
end

def show
end

private
def find_user
	@user = User.find(params[:id])
end

def find_collection
	@collection = @user.collection.find(params[:id])
end

end
