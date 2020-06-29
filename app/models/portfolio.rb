class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy

  # For nested attributes. This one says take many technologies as long as the name is not blank using lambda ->
  accepts_nested_attributes_for :technologies, reject_if: ->(attrs) { attrs['name'].blank? }

  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  # ONe way...
  def self.angular
    where(subtitle: "Angular")
  end

  # The other way using scopes {lambda}
  scope :ruby_items, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: 600, width: 400)
    self.thumb_image ||= Placeholder.image_generator(height: 350, width: 200)
    # ||= essentially saying if self.var == nil then = right side
  end

end
