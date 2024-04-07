Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/users/dash_boards', to: 'dash_boards#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
