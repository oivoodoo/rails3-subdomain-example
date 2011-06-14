Subdomain::Application.routes.draw do
  
  get "welcome/index"
  
  resource :welcome, :only => [:index]

end
