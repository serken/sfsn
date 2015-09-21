require 'logged_in_constraint'
Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'callback'  => 'sessions#callback'
  delete 'logout' => 'sessions#destroy'
  root to: 'home#index'
  get 'vk_board' => 'vk#index'
  get 'connect_vk' => 'sessions#new'
  get '/auth/facebook/callback', to: 'sessions#fb_new'
  get 'post_to_fb' => 'home#test'
  get 'update_group_id' => 'home#update_group_id'
end
