class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, class_name: "Post", foreign_key: :author_id, primary_key: :id
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
end
