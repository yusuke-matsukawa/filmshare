class GenrePost < ApplicationRecord
  belongs_to :genre
  belongs_to :post, inverse_of: :genre_posts
end
