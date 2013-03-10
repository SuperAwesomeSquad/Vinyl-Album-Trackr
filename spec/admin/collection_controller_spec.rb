require 'spec_helper'
include Devise::TestHelpers


describe Admin::CollectionsController do
render_views

before(:each) do
  @user = mock_model(User, :email => "tester@localspecs.com")
  request.env['tester'] = mock(Tester, :authenticate => @user, :authenticate! => @user)
end

describe "Get comments" do
  before(:each) do
    @post = Post.create! valid_attributes
    Post.should_receive(:find).at_least(:once).and_return(@post)
    get :comments, :id => @post.id
  end

  after(:each) do
    @post.destroy
  end

  it "gets the proper record to update" do
    assigns(:post).should eq(@post)
  end

  it "should render the actual template" do
    response.should contain("Comments")
    response.body.should =~ /Comments/m
  end


end


end
