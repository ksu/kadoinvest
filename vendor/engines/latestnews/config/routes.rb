::Refinery::Application.routes.draw do
  resources :latestnews, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :latestnews, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
