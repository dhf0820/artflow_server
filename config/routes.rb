Rails.application.routes.draw do
  apipie
  resources :art_requests do
    collection do
      get :processing_count
      get :search
    end
    resources :casino_card_art_requests do
      member do
        get :confirmation
      end
    end
  end

  get 'new_specification' => 'art_requests#new_specification'
  resources :users, only: [:create] 
  devise_for :users

  resources :users do
    resources :employees
  end

  resources :card_edges
  resources :card_faces
  resources :card_sizes
  resources :customer_card_backs
  resources :markets
  resources :card_packagings
  resources :card_mfg_units
  resources :card_order_types
  resources :products
  resources :product_types
  resources :card_papers
  resources :card_colors
  resources :card_print_seqs
  resources :card_families
  resources :card_jokers
  resources :card_aces
  resources :jobs
  resources :customers do
    collection do
      get :details
      get :customer_from_csv
      post :customer_from_csv
      get :customer_search
    end
  end
  root to: 'welcome#index'
  get 'artist' => 'artist#index'
  resource :pages do
    collection do
      get :not_authorized
    end
  end


  namespace :api, defaults: {format: 'json'}  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do

      resources :art_requests
      resources :card_face_types
      resources :card_back_types
      resources :card_ace_types
      resources :card_joker_types
      resources :sales_reps
      resources :customers do 
        collection do 
          get :customer_search
        end
      end
      resources :products do 
        collection do 
          get :details
        end
      end
    end
  end
end
