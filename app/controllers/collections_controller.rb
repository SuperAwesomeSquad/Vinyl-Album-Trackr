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
	@collection = @user.tickets.build(params[:ticket])
		if @collection.save
			flash[:notice] = "Your collection has been created."
			redirect_to [@user, @collection]
		else
			flash[:alert] = "Your collection has not been created."
			render :action => "new"
		end
end

def show
end

private
def find_user
	@user = User.find(params[:user_id])
end

def find_collection
	@collection = @user.collection.find(params[:user_id])
end

end
