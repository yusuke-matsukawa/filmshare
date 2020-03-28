class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :genre_posts, inverse_of: :post
  has_many :genres, through: :genre_posts
  accepts_nested_attributes_for :genre_posts  # postモデルに新しいレコードが保存された際に、そのpost_idとgenre_idがgenre_postに保存

  validates :title, presence: true
  validates :opinion, presence: true
end
