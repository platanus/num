class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery prepend: true

  before_action :authenticate_user!

  layout :layout_by_resource

  def layout_by_resource
    devise_controller? ? "devise" : "application"
  end
end
