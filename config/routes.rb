Rails.application.routes.draw do
  
  root "series#index"

 	#get '/series/filter/:scope' => "series#show", as: :filtered_comics

  resources :series do 
    resources :comics do 
    	post 'toggle_redeemed', :on => :member
    end
  end

end
