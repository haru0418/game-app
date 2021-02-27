class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  belongs_to :game_title
end
