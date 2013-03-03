class CollectionsController < ApplicationController

before_filter :find_user

def new
	@collection = @user.collections.build
end


private
def find_user
@user = User.find(params[:user_id])
end

end
