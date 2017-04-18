helpers do
  # This will return the current user, if they exist
  # Replace with code that works with your application
  def current_user
    if session["user"]
      @current_user ||= User.find_by_id(session["user"])
    end
    
    # capture(&block) if session["users"]
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    # capture(&block) unless session["users"]
    !current_user.nil?
  end
end





