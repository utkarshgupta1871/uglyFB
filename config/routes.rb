Rails.application.routes.draw do
  post 'likes/create/:id'=>'likes#create', as: :like
  delete 'likes/destroy/:id'=>'likes#destroy', as: :unlike

  root 'posts#index'
  get 'friendships/findFriends'=>'friendships#findFriends'
  get 'usersIndex'=>'friendships#index', as: :allUsers
  get 'friendships/addFriend/:id'=>'friendships#addFriend', as: :addFriend
  get 'friendships/confirmRequest/:id'=>'friendships#confirmRequest', as: :confirm_request
  get 'friendships/myFriends', as: :myFriends
  get 'myFriends'=> 'friendships#myFriends'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :posts do
  	resources :comments
  end
  get 'users/:id'=>'users#show', as: :profile
  patch 'users/:id'=>'users#update', as: :profile_update
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
