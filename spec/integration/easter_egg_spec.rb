require 'spec_helper'

feature 'Easter Eggs' do

  scenario 'do exist' do
    visit sharkfarts_path
    # page.should have_css(".lead")
    # within("body"){page.should have_content "Tina Fey"}

  end
end

