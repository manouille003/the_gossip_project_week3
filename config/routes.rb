Rails.application.routes.draw do

  get '/the_gossip_project/homepage', to:'static#index'

  get '/the_gossip_project/team', to:'static#team'

  get '/the_gossip_project/contact', to:'static#contact'

  get '/the_gossip_project/welcome/first_name', to:'static#welcome'

  get "up" => "rails/health#show", as: :rails_health_check

end
