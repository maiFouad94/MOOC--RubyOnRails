Rails.application.routes.draw do
 

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :courses do
  resources :lectures
end
  resources :lectures do
  	member do
    post :spam
    put "like", to: "lectures#upvote"
    put "dislike", to: "lectures#downvote"
  end
  resources :comments
end

  devise_for :users, controllers: { registrations: "users/registrations" }
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
