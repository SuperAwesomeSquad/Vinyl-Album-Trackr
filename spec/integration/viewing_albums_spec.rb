require 'spec_helper'

feature 'Viewing Albums' do

	# before do
	# 	user = Factory(:user, :email => "celluloid@example.com")
 #    	user.confirm!
 #    end

	scenario 'Viewing an album' do


		visit '/'
   		click_link "View All Albums"
	end
end
