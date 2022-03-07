class ApplicationController < ActionController::Base
  # before any page loads, find the current_user
  before_action :find_current_user

  # add in the method to use in the views
  helper_method :is_logged_in?

  def find_current_user
    @current_user = (User.find(session[:user_id]) if is_logged_in?)
  end

  # check login status
  def check_login
    redirect_to new_session_path unless is_logged_in?
  end

  # is the person logged in
  def is_logged_in?
    session[:user_id].present?
  end

  # check admin login status
  def check_admin
    @user = find_current_user

    redirect_to root_path unless @user.present? && @user.is_admin?
  end

  # find admin user
  def find_admin_user
    @current_user = find_current_user

    @current_user if @current_user.present? && @current_user.is_admin?
  end
end
