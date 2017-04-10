FactoryGirl.define do
  factory :comment, :class => 'Comment' do
    author
    body "Great article!"
  end
end
