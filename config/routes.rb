Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }
  resources :news
  resources :users
  resources :publishers do
		resources :titles
	end

  # Favorites
  post 'add_favorite/:title_id' => 'favorites#create', as: :save_favorite

  # MailChimp
  post 'tilfoej-bruger-til-mailliste' => 'mailchimp#add_mail_to_list', as: :add_to_mailchimp

	# Stripe
	resources :charges
	get 'tak-for-dit-koeb' => 'charges#thanks', as: :thanks

	# Sider (pages)
  get '/kurv' => 'pages#basket', as: :basket
	get '/forlagene' => 'pages#publishers', as: :all_publishers
	get '/forlaget/:id' => 'pages#publisher', as: :one_publisher
	get '/alle-titler' => 'pages#titles', as: :all_titles
	get '/forlaget/:publisher_id/bogen/:id' => 'pages#title', as: :one_title
	get '/forside' => 'pages#frontpage'
	get '/kontakt' => 'pages#contact', as: :contact
	get '/om-os' => 'pages#about', as: :about
	get '/admin' => 'admin#index'
	root 'pages#countdown'
end
