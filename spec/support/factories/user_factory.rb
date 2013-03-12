FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "celluloid@example.com" }
		password "password"
		password_confirmation "password"
	end
end
