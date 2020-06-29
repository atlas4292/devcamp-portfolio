module CurrentUserConcern
  extend ActiveSupport::Concern

  # This concern separates a guest user from a user who is logged in where super = logged in
  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: 'Guest User',
                   first_name: 'Guest',
                   last_name: 'User',
                   email: 'guest@somewhere.com'
                  )
  end

end