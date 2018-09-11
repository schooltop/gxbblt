Rails.application.routes.draw do
  resources :industryes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: 'employees#desboart'
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

    resources :industryes do 
      collection do 
      end
    end

    resources :companies do
      collection do
      end
    end

    resources :addresses do
      collection do
      end
    end

    resources :contacts do 
      collection do
      end
    end

    resources :messages do
      collection do
      end
    end

  end

  #root to: '/admin/employees'
  devise_for :employees, path: "admin", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'cmon_let_me_in' }, controllers: { sessions: "admin/sessions", passwords: "admin/passwords"}

end
