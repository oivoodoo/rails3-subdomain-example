class ApplicationController < ActionController::Base
  protect_from_forgery
  
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
      redirect_to welcome_index_url({:subdomain => current_account.name})
    end
  end
  
  def current_account
    if has_subdomain?
      @account = Account.first
    end
    @account
  end
  
  def current_account_name
    name = request.subdomains.first
    name = (params[:account_name] || "test-1") if 
    name
  end
  
  def has_subdomain?
    current_account_name.present? and current_account_name != 'www'
  end
  
  def test_env?
    %w(test cucumber).include?(Rails.env)
  end
end
