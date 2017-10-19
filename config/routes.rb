Rails.application.routes.draw do
  resources :comments
  resources :pictures, only: [:index]
  resources :blogs , only: [:index,:show]do
    collection do
      get :top_search
      post :upload_image
      get :add_comments
    end
  end
  namespace :admin do
    root to: 'employees#desboart'
    resources :categories do
      collection do
        get :show_name
      end  
    end
    resources :comments do
      collection do
        get :show_name
      end  
    end  

    resources :permissions do
      collection do
        get :show_name
        get  :add_roles
        post :save_roles
      end  
    end

    resources :roles do
      collection do
        get  :add_permissions
        post :save_permissions
        get  :add_employees
        post :save_employees
      end  
    end 
    resources :employees do
      collection do
        get  :forget_password
        post :forget_password
        get  :reset_mail
        get  :error_mail
        get  :add_roles
        post :save_roles
        get  :desboart
      end
    end
    resources :blogs do
      collection do
        post :upload_image
      end
    end
    resources :pictures do
      collection do
        post :upload_image
      end
    end
    resources :reports, only: [:index] do
      collection do
        get :download_excell_report
        get :import_excell
        post :save_import
      end  
    end
  end

  devise_for :employees, path: "admin", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'cmon_let_me_in' }, controllers: { sessions: "admin/sessions", passwords: "admin/passwords"}
  root to: 'blogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
