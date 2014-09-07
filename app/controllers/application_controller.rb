class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_locale

  private
  
  def set_locale
  	I18n.locale = params[:locale] if params.include?(:locale)
    # I18n.locale = params[:locale] || I18n.default_locale
    # Rails.application.routes.default_url_options[:locale]= I18n.locale
  end
  
  def default_url_options(options = {})
    { :locale => I18n.locale }.merge(options)
  end
  
  private
  
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halt the before_action
    else
      return true
    end
  end
  
end
