module CurrentUserConcern
  extend ActiveSupport::Concern

  # This concern separates a guest user from a user who is logged in where super = logged in
  def current_user
    super || guest_user
  end

  def guest_user
    # Old way without using self-created model
    # OpenStruct. new(name: 'Guest User',
    #               first_name: 'Guest',
    #               last_name: 'User',
    #               email: 'guest@somewhere.com')

    # New way from our model
    guest = GuestUser.new
    guest.name = 'Guest User'
    guest.first_name = 'Guest'
    guest.last_name = 'User'
    guest.email = 'guest@somewhere.com'
    guest
  end

end
