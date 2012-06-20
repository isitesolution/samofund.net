SamofundNet::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  devise_scope :user do
    get '/login'          => 'devise/sessions#new',     :as => 'new_user_session'
    get '/logout'         => 'sessions#destroy',        :as => 'destroy_user_session'
    get '/password/reset' => 'devise/passwords#new',    :as => 'new_user_password'
  end

  match 'dashboard' => 'dashboard#index', :as => 'user_root'
  match 'dashboard' => 'dashboard#index', :as => 'dashboard'
  match 'there_is_an_error' => 'exception#notify', :as => 'exception'

  root :to => 'home#index'
end