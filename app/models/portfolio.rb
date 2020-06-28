class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # ONe way...
  def self.angular
    where(subtitle: "Angular")
  end

  # The other way using scopes {lambda}
  scope :ruby_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= 'https://via.placeholder.com/600x400'
    self.thumb_image ||= 'https://via.placeholder.com/350x200'
    # ||= essentially saying if self.var == nil then = right side
  end
end
