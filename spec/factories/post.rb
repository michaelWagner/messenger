FactoryGirl.define do
  factory :post, :class => 'Post' do
    author
    title "How to read a book effectively"
    body  "There are five steps involved."
    after(:create) do |user|
      post.comment = FactoryGirl.create(:comment)
    end
  end
end
