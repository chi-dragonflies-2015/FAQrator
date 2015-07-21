class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #preserving if we ever want to run with a custom error page
  # def render_404
  #   render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
  # end

end
