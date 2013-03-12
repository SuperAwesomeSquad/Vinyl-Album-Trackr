require 'spec_helper'

feature 'Easter Eggs' do
  scenario 'Display Tina Fey Inspirational Message' do
    visit sharkfarts_path
    # page.should have_content "Tina Fey"
  end
end

