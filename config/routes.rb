Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'homes#index'
  get 'aboutUs', to: 'homes#about_us', as: 'about_us'
  get 'services', to: 'homes#services', as: 'services'
  get 'work', to: 'homes#work', as: 'work'
  get 'sitemap', to: 'homes#sitemap', as: 'sitemap'
  get 'career', to: 'homes#career', as: 'career'

  resources :posts do
  	resources :comments
  end
  
  get 'contact', to: 'contacts#new', as: 'contact'
  post 'contact', to: 'contacts#create'
  post 'message', to: 'contacts#message'
end
