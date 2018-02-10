Rails.application.routes.draw do
	
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
	
  get '/home', to: 'home#index'
  get '/home/:article', to: 'home#article_show', as: :home_article_show
	
	get '/users/:user_id/articles/:article_id/chats', to: 'articles#article_chats', as: :article_chats
	
	resources :users do
		resources :articles
	end
	
	resources :chats do
		resources :messages
	end
	
	root 'sessions#new'
end
