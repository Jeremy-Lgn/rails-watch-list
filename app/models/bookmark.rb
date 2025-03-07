class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :movie_id, :list_id, uniqueness: { scope: [:movie_id, :list_id] }
end
