Rails.application.routes.draw do
  
  resources :series do 
    resources :comics
  end

  root "series#index"
end
