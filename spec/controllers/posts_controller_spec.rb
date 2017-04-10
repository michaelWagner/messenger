require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  describe "GET index" do
    it "renders the index template" do
      expect({ :get => "/posts" }).to route_to(:controller => "posts", :action => "index")
    end
  end

  it "should create post" do
    before_count = Post.count
    post = Post.create!(:author_id => 1, :id => 1, :body => "something interesting", :title => "this is a title")
    expect(Post.count).not_to eq(before_count)
  end

  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "should be redirected to signin" do
      get :index
      expect( response ).to redirect_to( new_user_session_path )
    end

    it "should let a user see all the posts" do
      login_with create( :user )
      get :index
      expect( response ).to render_template( :index )
    end
  end
end
