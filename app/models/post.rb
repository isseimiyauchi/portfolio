class Post < ApplicationRecord
  validates :title, presence: true
  validates :from, presence: true
  validates :detail, presence: true

  belongs_to :user
end
