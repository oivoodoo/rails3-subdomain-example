class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include UrlHelper
  
  helper :all
  
  before_filter :check_account_access
  
  def default_url_options(options = nil)
    if test_env?
      {:account_name => current_account_name}
    else
      {}
    end
  end
  
  protected
  
  def check_account_access
    unless has_subdomain?
      redirect_to welcome_url({:subdomain => current_account.name})
    end
  end
  
  def current_account
    @account ||= Account.first
    @account
  end
  
  def current_account_name
    name = request.subdomains.first
    name = (params[:account_name] || "name-1") if test_env?
    name
  end
  
  def has_subdomain?
    request.subdomains.first.present? and current_account_name != 'www'
  end
  
  def test_env?
    %w(test cucumber).include?(Rails.env)
  end
end
