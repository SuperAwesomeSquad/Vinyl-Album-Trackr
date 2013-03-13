require 'spec_helper'

feature 'Deleting Albums' do
	let(:album) { Factory(:album, :title=>"Hello Nasty", :artists=>"Beastie Boys") }



 #  scenario 'Deleting an album' do
 #    visit '/albums'
 #    click_link 'Hello Nasty'
 #    click_link 'Delete Album'

 #    # page.should have_content("Album has been deleted.")

 #    visit '/'
	# # page.should_not have_content('Hello Nasty')
	# end
end
