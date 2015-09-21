class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :logged_in_vk?

  def logged_in?
    current_user.vk_token.present?
  end
end
