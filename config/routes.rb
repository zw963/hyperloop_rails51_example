Rails.application.routes.draw do
  mount Hyperloop::Engine => '/hyperloop'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'hyperloop#helloworld'
  root 'home#helloworld'
  get '/greeter' => 'home#meeter_greeter'
end
