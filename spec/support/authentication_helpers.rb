module AuthenticationHelpers

def sign_in_as!(user)
	visit '/users/sign_in'
	fill_in "Email", :with => "celluloid@example.com"
	fill_in "Password", :with => "password"
	click_button "Sign in"
	# visit '/'
	# page.should have_content("Signed in successfully.")
end
end

RSpec.configure do |c|
	c.include AuthenticationHelpers, :type => :request
end
