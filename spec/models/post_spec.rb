require "rails_helper"

RSpec.describe Post, :type => :model do
  context "without an author" do
    it "is not valid" do
      expect(Post.new(:author_id => "")).to_not be_valid
    end
  end

  context "with an author" do
    it "will save" do
      before_count = Post.count
      post = Post.create!(:author_id => 1)
      expect(Post.count).not_to eq(before_count)
    end
  end

  context "with 2 or more comments" do
    it "orders them in reverse chronologically" do
      post = Post.create!(:author_id => 1, :title => 'Hello world', :body => 'some testing words.')
      comment1 = post.comments.create!(:author_id => 1, :body => "first comment")
      comment2 = post.comments.create!(:author_id => 2, :body => "second comment")
      expect(post.reload.comments).to eq([comment2, comment1])
    end
  end

end
