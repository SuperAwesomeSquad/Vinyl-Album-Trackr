require 'spec_helper'

describe AlbumsController do
	it "displays an error for a missing album" do
		get :show, :id => "not-here"
		response.should redirect_to(albums_path)
		message = "The album you were looking for could not be found."
		flash[:alert].should == message
	end


end
