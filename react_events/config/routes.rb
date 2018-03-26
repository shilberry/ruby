Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"


 root 'dashboard#index'
  namespace :api do
    resources :events, only: [:index, :create] do
      get :search, on: :collection
    end

  end

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
