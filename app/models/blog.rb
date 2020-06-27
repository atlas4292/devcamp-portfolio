class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Input validation
  validates_presence_of :title, :body

  belongs_to :topic
end
