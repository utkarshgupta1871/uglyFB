Rails.application.routes.draw do
  root 'posts#index'
  get 'usersIndex'=>'friendships#index', as: :allUsers
  get 'friendships/addFriend/:id'=>'friendships#addFriend', as: :addFriend
  get 'friendships/myFriends', as: :myFriends
  get 'myFriends'=> 'friendships#myFriends'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :posts do
  	resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
