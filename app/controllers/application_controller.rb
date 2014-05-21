class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :register!, :register?

  def unregister!
    session[:registered] = false
  end
  def register!
    session[:registered] = true
  end
  def register?
    return session[:registered]
  end

end
