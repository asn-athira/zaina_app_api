Rails.application.routes.draw do
  get '/', to:'home#index'
  resources :services
  resources :offers
  resources :books do
	  member do
	    get :get_user_books
	  end
	end
	resources :users
  post 'authenticate', to: 'authentication#authenticate'
  get 'get_user_books', to: 'books#get_user_books'
  post 'forgot_password', to:'passwords#forgot'
  post 'reset_password', to:'passwords#reset'
  get 'profile', to: 'profile#index'
end
