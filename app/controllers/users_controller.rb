class UsersController < Admin::BaseController
  	before_filter :find_user, :only => [:show, :edit, :update, :destroy, :new, :index]

 #  	def index
 #  	@users = User.all(:order => "email")
 #  	end

 #  	def show
 #  	end

  	def new
	  	@user = User.new
	end

	# def edit
	# end

	# def create
	# 	@user = User.new(params[:user], :as => :admin)
	# 		if @user.save
	# 			flash[:notice] = "User has been created."
	# 			redirect_to admin_users_path
	# 		else
	# 			flash.now[:alert] = "User has not been created."
	# 			render :action => "new"
	# 		end
	# end

	def update
		@user.skip_reconfirmation!
		if params[:user][:password].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end

		if @user.update_attributes(params[:user], :as => :admin)
			flash[:notice] = "User has been updated."
			redirect_to admin_users_path
		else
			flash[:alert] = "User has not been updated."
			render :action => "edit"
		end
	end

	def destroy
		if @user == current_user
			flash[:alert] = "You cannot delete yourself!"
		else
			@user.destroy
			flash[:notice] = "User has been deleted."
		end

		redirect_to admin_users_path
	end

private
	def find_user
		@user = User.find(params[:id])
	end
end
