class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # starting below we create the virtual attribute for first and last name with validation filters for the
  # whole name entry (only one box for user to enter full name -- we take care of rest i.e. splitting name)
  validates_presence_of :name

  def first_name
    self.name.split.first
    # rubified version -- python or other languages would index using [] (ex: self.name.split[0])
  end

  def last_name
    self.name.split.last
  end

end
