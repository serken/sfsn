Rails.application.routes.draw do

  mount Resque::Server.new, at: '/resque'

  #devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'callback'  => 'group_authorize#vk_callback'
  delete 'logout_vk' => 'group_authorize#vk_destroy'
  root to: 'home#index'
  get 'vk_board' => 'vk#index'
  get 'connect_vk' => 'group_authorize#vk_new'
  get '/auth/facebook/callback', to: 'group_authorize#fb_new'
  get 'post_to_fb' => 'home#test'
  get 'update_group' => 'home#update_group'
  get '/users/:id', :to => 'users#show', :as => :user
  post '/update_group_id', to: 'home#update_group_id'
end
