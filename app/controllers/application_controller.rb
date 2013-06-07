class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :https_only_for_devise

  rescue_from CanCan::AccessDenied do |exception|
  	flash[:error] = "Access denied!"
    redirect_to root_url
  end  
  
  def https_only_for_devise
    if (@@ssl_controllers.index(params[:controller]) == nil && request.ssl?)
      redirect_to :protocol => 'http://'
    end
  end
end
