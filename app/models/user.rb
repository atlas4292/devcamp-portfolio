class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor], multiple: false)                                      ##
  ############################################################################################ 
 

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

  def get_facebook_message
  end

end
