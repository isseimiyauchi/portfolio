class Post < ApplicationRecord
  validates :title, presence: true
  validates :detail, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :commented_users, through: :comments, source: :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
end
