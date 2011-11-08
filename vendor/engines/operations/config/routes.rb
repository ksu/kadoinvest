::Refinery::Application.routes.draw do
  resources :operations, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :operations, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
