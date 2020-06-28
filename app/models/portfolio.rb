class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # ONe way...
  def self.angular
    where(subtitle: "Angular")
  end

  # The other way using scopes {lambda}
  scope :ruby_items, -> { where(subtitle: 'Ruby on Rails') }

end
