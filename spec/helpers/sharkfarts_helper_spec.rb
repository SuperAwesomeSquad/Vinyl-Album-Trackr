require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SharkfartsHelper. For example:
#
# describe SharkfartsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe SharkfartsHelper do
  describe "random tina fey message" do
    it "displays a random string" do
      helper.generate_saying.class.should == String
    end
  end
end
