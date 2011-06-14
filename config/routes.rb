Subdomain::Application.routes.draw do

  root :to => "welcome#index"
  
  match "/" => "welcome#index", :as => :welcome
end
