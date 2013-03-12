require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:

describe ApplicationHelper do
  describe "#alertStyleClassGenerator" do
  	it "Returns proper styles for :alert" do
  		helper.alertStyleClassGenerator(:alert).should == "alert alert-error"
  	end
  	it "Returns proper styles for :notice" do
  		helper.alertStyleClassGenerator(:notice).should == "alert alert-success"
  	end
  	it "Returns a notice if other alert symbol" do
  		helper.alertStyleClassGenerator(:doesntexist).should == "alert alert-notice"
  	end
  end
end
