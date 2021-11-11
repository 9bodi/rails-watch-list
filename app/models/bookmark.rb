class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates_uniqueness_of :movie_id, :list_id, scope: [:list_id, :movie_id]
  validates :comment, length: { minimum: 6 }
end
