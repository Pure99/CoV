Rails.application.routes.draw do
  devise_for :users
	root to: "home#index"
	get 'persons/profile', as: 'user_root'
	resources :tables do
		resources :lines
	end	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
