class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :genre_posts
  has_many :genres, through: :genre_posts

  validates :title, presence: true
  validates :opinion, presence: true
end
