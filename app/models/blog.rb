class Blog < ApplicationRecord
  enum status: { Draft: 0, Published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Input validation
  validates_presence_of :title, :body

  belongs_to :topic

  def self.special_blogs
    # all
    # This was used as an example of how to add and use an instance
    # variable for the blogs class
  end

  def self.all_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end
end
