Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root "home#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/users/dash_boards', to: 'dash_boards#index'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # 追記する
  def update_resource(resource, params)
    params.delete(:current_password)
    resource.update_without_password(params)
  end
end
