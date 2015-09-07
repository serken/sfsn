require 'logged_in_constraint'
Rails.application.routes.draw do
  get 'callback'  => 'sessions#callback'
  delete 'logout' => 'sessions#destroy'
  root to: 'home#index', constraints: LoggedInConstraint.new, as: :home
  root to: 'sessions#new'
end
