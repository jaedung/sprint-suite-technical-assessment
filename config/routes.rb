Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root 'posts#index'

  get '/', to: redirect('/posts')

  resources :posts, except: [:create] do
    collection do
      get 'search'
    end
  end
end
