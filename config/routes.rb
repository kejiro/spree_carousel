Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :carousels do
      resources :items, controller: :carousel_items do
        collection do
          post :update_positions
        end
        member do
          put :enable
          put :disable
        end
      end
    end
  end
end
