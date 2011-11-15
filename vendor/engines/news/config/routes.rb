::Refinery::Application.routes.draw do
  resources :news, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :news, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
