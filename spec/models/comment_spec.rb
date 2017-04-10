RSpec.describe Comment, :type => :model do
  describe "fails when name is not present" do
    post = Post.create!(:author_id => 1, :body => 'anything')
    before { Comment.create!(:author_id => 1, :post_id => post.id, :body => 'something else') }
    it { expect be_valid }
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
