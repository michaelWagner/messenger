RSpec.describe Comment, :type => :model do
  describe "throws validation error when" do
    post = Post.create!(:author_id => 1, :body => 'anything')

    it "doesn't have a post" do
      comment = Comment.new(:author_id => 1, :body => 'something else')
      expect(comment).not_to be_valid
    end

    it 'body is empty' do
      comment = Comment.new(:author_id => 1, :post_id => post.id)
      expect(comment).not_to be_valid
    end
  end

  describe 'gets created' do
    it 'with proper attributes' do
      before_count = Comment.count
      post = Post.create!(:author_id => 1, :body => 'anything')
      comment = Comment.create!(:author_id => 1, :post_id => post.id, :body => 'something')
      expect(Comment.count).not_to eq(before_count)
    end
  end
end
