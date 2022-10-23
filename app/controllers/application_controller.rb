class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  # Handling authentication

  # ------------ Find the current user details ---------------------
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # Make the current_user method available to views also, not just controllers, by defining a helper method:
  helper_method :current_user

  # ----------------------------- Check if the session is still active: the user is still logged in -----------------------------
  def logged_in?
    current_user
  end
  # Make the logged_in? method available to views also, not just controllers, by defining a helper method.
  helper_method :logged_in?


  # This is a method that could be used as a callback handler
  # For example to check if the user is logged it before any action
  # check the owners_controller, or pets_controller for instance
  # and cannot be called in views, as we did not create a helper for it
  def check_login
    redirect_to login_path, alert: "You need to log in to view this page." if current_user.nil?
  end
end
