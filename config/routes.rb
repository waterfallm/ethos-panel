Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "/", to: "rig_stats#index"

  get "get.php", to: "ethos_proxy#forward"
  get "/message", to: "ethos_proxy#message"
end
