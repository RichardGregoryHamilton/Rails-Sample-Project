class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  
  protected
  
    def not_found
      render '_not_found'
    end
	
end
