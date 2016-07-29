Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/signup', to: 'users#signup'
  post '/login',  to: 'users#login'

  resources :players, only: [:create, :show, :index]

  resources :tournaments, only: [:create, :index, :show] do
    post "/seed", to: "tournaments#seed"
    get  "/standings", to: "tournaments#standings"
    post "/add-player", to: "competitors#create"
    resources :matches, only: [:update]
  end

end
