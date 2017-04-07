class Post < ActiveRecord::Base
  validates :author_id, presence: true

  belongs_to :author,
             class_name: "User",
             foreign_key: :author_id,
             primary_key: :id

  has_many :comments, class_name: "Comment"
  # has_many :commenters, through: :comments, source: :user

end
