::Refinery::Application.routes.draw do
  resources :newsfeeds, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :newsfeeds, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
