Rails.application.routes.draw do
  devise_for :users, :path_names => {:sign_up => "8626705366" }
  resources :rules_files

  devise_scope :user do
    get "8626705366", to: "devise/registrations#new"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
